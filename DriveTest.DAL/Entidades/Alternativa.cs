using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class Alternativa
    {
        #region private fields
        private int _id;
        private string _descripcionAlternativa;
        private bool _esCorrecta;
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

        public string DescripcionAlternativa
        {
            get
            {
                return _descripcionAlternativa;
            }
            set
            {
                _descripcionAlternativa = value;
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
        #endregion public fields

        #region constructors
        /// <summary>
        /// Inicializa la clase vacía.
        /// </summary>
        public Alternativa()
        {

        }

        /// <summary>
        /// Inicializa la clase con los datos de bd
        /// </summary>
        /// <param name="id"></param>
        /// <param name="descripcionAlternativa"></param>
        /// <param name="esCorrecta"></param>
        public Alternativa(int id, string descripcionAlternativa, bool esCorrecta)
        {
            Id = id;
            DescripcionAlternativa = descripcionAlternativa;
            EsCorrecta = esCorrecta;
        }
        #endregion constructors
    }
}
