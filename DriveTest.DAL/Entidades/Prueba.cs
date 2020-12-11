using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class Prueba
    {
        #region private fields
        private List<Pregunta> _preguntas;
        private Usuario _usuario;
        private bool _aprobado;
        private int _cantidadBuenas;
        #endregion

        #region public fields
        public List<Pregunta> Preguntas
        {
            get
            {
                return _preguntas;
            }
            set
            {
                _preguntas = value;
            }
        }
        public Usuario Usuario
        {
            get
            {
                return _usuario;
            }
            set
            {
                _usuario = value;
            }
        }
        public bool Aprobado
        {
            get
            {
                return _aprobado;
            }
            set
            {
                _aprobado = value;
            }
        }
        public int CantidadBuenas
        {
            get
            {
                return _cantidadBuenas;
            }
            set
            {
                _cantidadBuenas = value;
            }
        }
        #endregion

        #region constructors
        /// <summary>
        /// Inicializa clase vacía
        /// </summary>
        public Prueba()
        {

        }

        /// <summary>
        /// Inicializa clase con la lista de preguntas
        /// </summary>
        /// <param name="preguntas"></param>
        public Prueba(List<Pregunta> preguntas)
        {
            Preguntas = preguntas;
        }

        /// <summary>
        /// Inicializa la clase con la lista de preguntas y el usuario asignado
        /// </summary>
        /// <param name="preguntas"></param>
        /// <param name="usuario"></param>
        public Prueba(List<Pregunta> preguntas, Usuario usuario)
        {
            Preguntas = preguntas;
            Usuario = usuario;
        }
        #endregion
    }
}
