using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class TipoPregunta
    {
        #region private fields
        private int _id;
        private string _descripcion;
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

        public string Descripcion
        {
            get
            {
                return _descripcion;
            }
            set
            {
                _descripcion = value;
            }
        }
        #endregion public fields

        #region constructors
        public TipoPregunta()
        {

        }

        public TipoPregunta(int id, string descripcion)
        {
            Id = id;
            Descripcion = descripcion;
        }
        #endregion constructors
    }
}
