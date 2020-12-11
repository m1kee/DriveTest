using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class TipoUsuario
    {
        private int _id;
        private string _descripcion;

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

        public TipoUsuario()
        {

        }

        public TipoUsuario(int id, string descripcion)
        {
            Id = id;
            Descripcion = descripcion;
        }

    }
}
