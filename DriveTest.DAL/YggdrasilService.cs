using DriveTest.DAL.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL
{
    public class YggdrasilService
    {
        /// <summary>
        /// Obtiene el listado de preguntas para realizar el test, consta de 35 preguntas obtenidas de manera random.
        /// </summary>
        /// <returns>Listado de preguntas con sus alternativas y material correspondiente</returns>
        public List<Pregunta> obtienePreguntas()
        {
            try
            {
                List<Pregunta> preguntas = new List<Pregunta>();

                using (yggdrasilEntities context = new yggdrasilEntities())
                {
                    preguntas = (from p in context.pregunta
                                 join tp in context.tipo_pregunta on p.id_tipo_pregunta equals tp.id
                                 join i in context.imagen on p.id equals i.id_pregunta into iL
                                 from img in iL.DefaultIfEmpty() // left outer join
                                 select new Pregunta
                                 {
                                     //pregunta
                                     Id = p.id,
                                     DescripcionPregunta = p.descripcion_pregunta,
                                     EsAleatoria = p.alternativas_aleatorias,
                                     Comentario = p.comentario,


                                     //tipo pregunta 
                                     TipoPregunta = new TipoPregunta { Id = tp.id, Descripcion = tp.descripcion_tipo_pregunta },

                                     //imagen
                                     Imagen = img == null ? null : new Imagen { Id = img.id, NombreImagen = img.nombre_imagen, Formato = img.formato },

                                     //alternativas
                                     Alternativas = (from a in context.alternativa
                                                     where a.id_pregunta == p.id
                                                     select new Alternativa
                                                     {
                                                         Id = a.id,
                                                         DescripcionAlternativa = a.descripcion_alternativa,
                                                         EsCorrecta = a.es_correcta
                                                     }).ToList()
                                 }).OrderBy(x => Guid.NewGuid()).Take(35).ToList();
                }

                return preguntas;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Usuario obtieneUsuario(string rut) {
            try
            {
                Usuario usuario = new Usuario();
                using (yggdrasilEntities context = new yggdrasilEntities())
                {
                    usuario = (from u in context.usuario
                               join tu in context.tipo_usuario on u.tipo_usuario equals tu.id
                               where u.rut == rut
                               select new Usuario
                               {
                                   Id = u.id,
                                   Rut = u.rut,
                                   Password = u.password,
                                   PrimerNombre = u.primer_nombre,
                                   SegundoNombre = u.segundo_nombre ?? string.Empty,
                                   PrimerApellido = u.primer_apellido,
                                   SegundoApellido = u.segundo_apellido ?? string.Empty,
                                   Correo = u.correo ?? string.Empty,
                                   Telefono = u.telefono ?? string.Empty,
                                   TipoUsuario = new TipoUsuario { Id = tu.id, Descripcion = tu.descripcion }
                               }).FirstOrDefault();

                    return usuario;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
