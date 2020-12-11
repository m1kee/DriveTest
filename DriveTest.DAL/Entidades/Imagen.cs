using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class Imagen
    {
        #region private fields
        private int _id;
        private string _nombreImagen;
        private string _formato;
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

        public string NombreImagen
        {
            get
            {
                return _nombreImagen;
            }
            set
            {
                _nombreImagen = value;
            }
        }

        public string Formato
        {
            get
            {
                return _formato;
            }
            set
            {
                _formato = value;
            }
        }
        #endregion public fields

        #region constructors
        /// <summary>
        /// Inicializa la clase vacía.
        /// </summary>
        public Imagen()
        {

        }

        /// <summary>
        /// Inicializa la clase con los datos de bd
        /// </summary>
        /// <param name="id"></param>
        /// <param name="nombreImagen"></param>
        /// <param name="formato"></param>
        public Imagen(int id, string nombreImagen, string formato)
        {
            Id = id;
            NombreImagen = nombreImagen;
            Formato = formato;
        }
        #endregion constructors
    }
}
