using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DriveTest.DAL;
using DriveTest.DAL.Entidades;
using System.Net.Http;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace DriveTest.WEB.Controllers
{
    public class HomeController : Controller
    {
        YggdrasilService yggdrasilService = new YggdrasilService();
        Prueba prueba;

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Test()
        {
            prueba = new Prueba();
            prueba.Preguntas = OrdenaAlternativasAleatoriamente(yggdrasilService.obtienePreguntas());

            return View(prueba);
        }
        
        public JsonResult ValidarTest(Prueba prueba)
        {
            try
            {
                int respuestasCorrectas = 0;
                foreach (Pregunta pregunta in prueba.Preguntas)
                {
                    // validamos que el usuario haya respondido algo
                    if (!string.IsNullOrEmpty(pregunta.Respuesta))
                    {
                        // obtenemos las respuestas del usuario
                        Array respuestas = pregunta.Respuesta.Split('|');
                        // obtenemos las respuestas correctas de la pregunta
                        List<Alternativa> alternativasCorrectas = pregunta.Alternativas.Where(a => a.EsCorrecta == true).ToList();
                        int correcta = 0;
                        foreach (Alternativa alternativa in alternativasCorrectas)
                        {
                            foreach (string respuesta in respuestas)
                            {
                                if (alternativa.Id == Convert.ToInt32(respuesta))
                                {
                                    correcta++;
                                }
                            }
                        }
                        if (alternativasCorrectas.Count == correcta)
                        {
                            pregunta.EsCorrecta = true;
                            respuestasCorrectas++;
                        }
                    }
                }
                prueba.CantidadBuenas = respuestasCorrectas;
                // validamos si aprobamos el examen
                prueba.Aprobado = (prueba.CantidadBuenas >= (prueba.Preguntas.Count - 3)) ? true : false;

                return new JsonResult { Data = prueba };
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { errorCode = new HttpResponseMessage(HttpStatusCode.BadRequest), Exception =  ex.Message, StackTrace = ex.StackTrace } };
            
            }
        }

        public List<Pregunta> OrdenaAlternativasAleatoriamente(List<Pregunta> preguntas)
        {
            try
            {
                foreach (Pregunta pregunta in preguntas)
                {
                    if (pregunta.EsAleatoria)
                    {
                        pregunta.Alternativas = pregunta.Alternativas.OrderBy(x => Guid.NewGuid()).ToList();
                    }
                }

                return preguntas;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public JsonResult IniciarSesion(string rut, string password)
        {
            try
            {
                Usuario usuario = new Usuario();
                usuario = yggdrasilService.obtieneUsuario(rut);
                if(usuario != null)
                {
                    if(validaPassword(usuario, password))
                    {
                        return new JsonResult { Data = new { InicioSesionOK = true, Message = "Inicio de sesión exitoso." } };
                    }
                    else
                    {
                        return new JsonResult { Data = new { InicioSesionOK = false, Message = "Contraseña Incorrecta." } };
                    }
                }
                else
                {
                    return new JsonResult { Data = new { InicioSesionOK = false, Message = "Usuario no existe." } };
                }
            }
            catch (Exception ex)
            {
                return new JsonResult { Data = new { errorCode = new HttpResponseMessage(HttpStatusCode.BadRequest), Exception = ex.Message, StackTrace = ex.StackTrace } };
            }
        }

        public bool validaPassword(Usuario usuario, string password)
        {
            try
            {
                using (MD5 md5hash = MD5.Create())
                {
                    // convierto el input string a hash
                    string hash = GetMd5Hash(md5hash, password);

                    // comparo el input string con el password del usuario
                    return (usuario.Password == hash);
                }
                    
            }
            catch (Exception)
            {
                throw;
            }
        }

        public string GetMd5Hash(MD5 md5Hash, string input)
        {
            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
    }
}