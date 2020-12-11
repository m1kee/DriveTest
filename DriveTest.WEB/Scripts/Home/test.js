$(function () {
    // Inicializamos el wizard.
    $('#rootwizard').bootstrapWizard({
        onTabShow: function (tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;
            var $percent = $current / $total * 100;
            $('#rootwizard .progress-bar').css({ width: $percent + '%' }).html(Math.trunc($percent) + '%');
        }
    });

    // Finalizar Test
    $("#btnFinalizarTest").click(finalizarTest);

    // Botones para comenzar un nuevo test.
    $("#btnNuevoTest").click(nuevoTest);
    $("#btnModalNuevoTest").click(nuevoTest);
});

function nuevoTest() {
    window.location = urlNuevoTest;
}

function finalizarTest() {
    // Nos vamos al primer tab
    $('#rootwizard .wizard li.first').click();
    // Escondemos el boton para evitar presionarlo denuevo.
    $(this).hide();
    // Mapeamos las respuestas al modelo.
    $.each($(".tab-content .tab-pane"), function (index, value) {
        let alternativas = "";
        $.each($("#" + value.id + " :checked"), function (i, val) {
            if ($(val).is(":checked")) {
                if (i === $("#" + value.id + " :checked").length - 1) {
                    alternativas += val.id.substring(3); // el substring es para eliminar el cb_.
                } else {
                    alternativas += val.id.substring(3) + "|";
                }
            }
        });
        model.Preguntas[index].Respuesta = alternativas;
    });

    $.ajax({
        url: validaTest,
        data: model,
        method: "POST",
        success: function (data) {
            // Mostramos el modal con la información del test
            $("#modal_resultado .modal-title").text(data.Aprobado === true ? "Test Aprobado" : "Test Reprobado");
            $("#modal_resultado .modal-body").html(
                "<p><strong>Total Preguntas: " + data.Preguntas.length + "</strong><p>" +
                "<p><strong>Total Correctas: " + data.CantidadBuenas + "</strong><p>" +
                "<p><strong>Total Incorrectas: " + (data.Preguntas.length - data.CantidadBuenas) + "</strong><p>" +
                "<p><strong>Procentaje Aprobación: " + (data.CantidadBuenas == 0 ? "0%" : (Math.trunc((data.CantidadBuenas * 100) / data.Preguntas.length) + "%")) + "</strong><p>"
            );
            // Inicializamos el modal de bootstrap
            $("#modal_resultado").modal({
                backdrop: 'static',
                keyboard: false
            });
            $("#modal_resultado").modal('show');

            // Colocamos los tickets de respuestas correctas
            $.each(data.Preguntas, function (index, pregunta) {
                // Escribimos si la respuesta fue correcta o no dentro de cada tab para poder revisar.
                $("#tab_" + pregunta.Id + " p").after(
                    pregunta.EsCorrecta == true ? "<p style=\"color: #9FF781;\"><strong><em>CORRECTA.</em></strong></p>" : "<p style=\"color: #FA5858;\"><strong><em>INCORRECTA.</em></strong></p>",
                    pregunta.Comentario != null ? "<p> <em> " + pregunta.Comentario + ".</em></p>" : ""
                );

                // Marcamos las correctas e incorrectas
                $.each($("#tab_" + pregunta.Id + " input"), function (i, input) {

                    $(input).prop("disabled", "disabled");
                    if (pregunta.Alternativas[i].EsCorrecta) {
                        $(input).parent().addClass("correcta");
                    } else {
                        $(input).parent().addClass("incorrecta");
                    }
                });
            });
        },
        // En caso de error lo escribimos en la consola.
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });
}
