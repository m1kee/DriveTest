$(function () {
    ValidarCaractereskeypress("txtRut", 6, 0);

    $(document).keypress(function (e) {
        if (e.which == 13) {
            iniciarSesion();
        }
    });

    $('#txtRut').on('blur', formatearRut);

    $('#btnIniciarSesion').on('click', iniciarSesion);

    function iniciarSesion() {
        let rut = $('#txtRut');
        let password = $('#txtPassword');
        let mensajeError = $("#lblMensajeError");

        // removemos los errores
        mensajeError.parent().parent().hide();
        rut.parent().parent().removeClass('has-error');
        password.parent().parent().removeClass('has-error');

        if (rut.val() !== '' && password.val() !== '') {
            $.ajax({
                url: "@Url.Action("IniciarSesion","Home")",
                method: 'post',
                dataType: 'json',
                data: { rut: rut.val(), password: password.val() },
                success: function (data) {
                    //recargamos la página en caso de hacer login
                    if (data.InicioSesionOK) {
                        window.location = "@Url.Action("Index","Home")";
                    }
                    // mostramos mensajes de error
                    mensajeError.text(data.Message);
                    mensajeError.parent().parent().show();
                    console.log(data.Message);
                },
                error: function (xhr, errorThrown, message) {
                    console.log(xhr);
                    console.log(errorThrown);
                    console.log(message);
                }
            });
        } else if (rut.val() == '') {
            // obtenemos el form group
            rut.parent().parent().addClass('has-error');
        } else if (password.val() == '') {
            // obtenemos el form group
            password.parent().parent().addClass('has-error');
        }
    }

    function formatearRut() {
        var rut = $('#txtRut');
        var posicion = 0;  //contador de para saber cuando insertar el . o la -
        var rutInvertido = ""; //Guarda el rut invertido con los puntos y el guión agregado
        var rutFinal = ""; //Guarda el resultado final del rut como debe ser
        for (var i = rut.val().length - 1; i >= 0; i--) {
            rutInvertido += rut.val().charAt(i);
            if (i == rut.val().length - 1)
                rutInvertido += "-";
            else if (posicion == 3) {
                rutInvertido += ".";
                posicion = 0;
            }
            posicion++;
        }
        for (var j = rutInvertido.length - 1; j >= 0; j--) {
            if (rutInvertido.charAt(rutInvertido.length - 1) != ".")
                rutFinal += rutInvertido.charAt(j);
            else if (j != rutInvertido.length - 1)
                rutFinal += rutInvertido.charAt(j);
        }
        //Pasamos al campo el valor formateado
        rut.val(rutFinal.toUpperCase());
    }
});