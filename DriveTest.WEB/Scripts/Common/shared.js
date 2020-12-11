function ValidarCaractereskeypress(textbox, opcion, signos) {
    $("#" + textbox).keypress(function (e) {

        var numeros = "1234567890";
        var letras = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ áéíóúÁÉÍÓÚ";
        var correo = "@._";
        var signo = "-";
        var digitoverificador = "kK";
        var puntuacion = ".,";
        var coma = ",";
        var varios = "@._+-.,;:!¡¿?/()*><°=";
        var slash = "/";

        var resultado = "";

        if (opcion == 1) {//solo numeros
            resultado = numeros;
        }
        else if (opcion == 2) {//solo letras
            resultado = letras;
        }
        else if (opcion == 3) {//alfanumericos
            resultado = letras + numeros;
        }
        else if (opcion == 4) {//e-mail
            resultado = letras + numeros + correo;
        }
        else if (opcion == 5) {//caracteres
            resultado = letras + numeros + varios;
        }
        else if (opcion == 6) {//digitoverificador
            resultado = numeros + digitoverificador;
        }
        else if (opcion == 7) {//numeros de certificados
            resultado = letras + numeros + signo;
        }
        else if (opcion == 8) {//fecha
            resultado = numeros + slash;
        }
        else if (opcion == 9) {//alfanumericos y Slash 
            resultado = letras + numeros + slash;
        }

        if (signos == 1) {//signo
            resultado += signo;
        }
        else if (signos == 2) {//signo y puntuacion
            resultado += signo + puntuacion;
        }
        else if (signos == 3) {//coma
            resultado += coma;
        }

        if (resultado.indexOf(String.fromCharCode(e.which)) != -1) {
            return true;
        }
        else {
            return false;
        }
    });
}
