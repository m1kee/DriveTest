using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class Pregunta
    {
        #region private fields
        private int _id;
        private TipoPregunta _tipoPregunta;
        private string _descripcionPregunta;
        private List<Alternativa> _alternativas;
        private Imagen _imagen;
        private string _respuesta;
        private bool _esCorrecta;
        private bool _esAleatoria;
        private string _comentario;
        #endregion private fields

        #region public fields
        public int Id
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }

        public TipoPregunta TipoPregunta
        {
            get
            {
                return _tipoPregunta;
            }
            set
            {
                _tipoPregunta = value;
            }
        }

        public string DescripcionPregunta
        {
            get
            {
                return _descripcionPregunta;
            }
            set
            {
                _descripcionPregunta = value;
            }
        }

        public List<Alternativa> Alternativas
        {
            get
            {
                return _alternativas;
            }
            set
            {
                _alternativas = value;
            }
        }

        public Imagen Imagen
        {
            get
            {
                return _imagen;
            }
            set
            {
                _imagen = value;
            }
        }

        public string Respuesta
        {
            get
            {
                return _respuesta;
            }
            set
            {
                _respuesta = value;
            }
        }

        public bool EsCorrecta
        {
            get
            {
                return _esCorrecta;
            }
            set
            {
                _esCorrecta = value;
            }
        }

        public bool EsAleatoria
        {
            get
            {
                return _esAleatoria;
            }
            set
            {
                _esAleatoria = value;
            }
        }

        public string Comentario
        {
            get
            {
                return _comentario;
            }
            set
            {
                _comentario = value;
            }
        }
        #endregion public fields

        #region constructors
        /// <summary>
        /// Inicializa la clase vacía.
        /// </summary>
        public Pregunta()
        {
            EsCorrecta = false;
        }

        /// <summary>
        /// Inicializa la clase con los datos de bd, menos la imagen
        /// </summary>
        /// <param name="id"></param>
        /// <param name="tipoPregunta"></param>
        /// <param name="descripcion"></param>
        /// <param name="alternativas"></param>
        public Pregunta(int id, TipoPregunta tipoPregunta, string descripcion, List<Alternativa> alternativas, bool esAleatoria, string comentario)
        {
            Id = id;
            TipoPregunta = tipoPregunta;
            DescripcionPregunta = descripcion;
            Alternativas = alternativas;
            EsCorrecta = false;
            EsAleatoria = esAleatoria;
            Comentario = comentario;
        }

        /// <summary>
        /// Inicializa la clase con datos de bd, junto con imagen.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="tipoPregunta"></param>
        /// <param name="descripcion"></param>
        /// <param name="alternativas"></param>
        /// /// <param name="imagen"></param>
        public Pregunta(int id, TipoPregunta tipoPregunta, string descripcion, List<Alternativa> alternativas, Imagen imagen, bool esAleatoria, string comentario)
        {
            Id = id;
            TipoPregunta = tipoPregunta;
            DescripcionPregunta = descripcion;
            Alternativas = alternativas;
            Imagen = imagen;
            EsCorrecta = false;
            EsAleatoria = esAleatoria;
            Comentario = comentario;
        }
        #endregion constructors
    }
}
