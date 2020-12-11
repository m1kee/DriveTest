using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DriveTest.DAL.Entidades
{
    public class Usuario
    {
        #region private fields
        private int _id;
        private string _rut;
        private string _primerNombre;
        private string _segundoNombre;
        private string _primerApellido;
        private string _segundoApellido;
        private string _correo;
        private string _telefono;
        private TipoUsuario _tipoUsuario;
        private string _password;
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
        public string Rut
        {
            get
            {
                return _rut;
            }
            set
            {
                _rut = value;
            }
        }
        public string PrimerNombre
        {
            get
            {
                return _primerNombre;
            }
            set
            {
                _primerNombre = value;
            }
        }
        public string SegundoNombre
        {
            get
            {
                return _segundoNombre;
            }
            set
            {
                _segundoNombre = value;
            }
        }
        public string PrimerApellido
        {
            get
            {
                return _primerApellido;
            }
            set
            {
                _primerApellido = value;
            }
        }
        public string SegundoApellido
        {
            get
            {
                return _segundoApellido;
            }
            set
            {
                _segundoApellido = value;
            }
        }
        public string Correo
        {
            get
            {
                return _correo;
            }
            set
            {
                _correo = value;
            }
        }
        public string Telefono
        {
            get
            {
                return _telefono;
            }
            set
            {
                _telefono = value;
            }
        }
        public TipoUsuario TipoUsuario
        {
            get
            {
                return _tipoUsuario;
            }
            set
            {
                _tipoUsuario = value;
            }
        }
        public string Password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }
        #endregion publc fields

        #region constructors
        public Usuario(int id, string rut, string password, string primerNombre, string segundoNombre, string primerApellido, string segundoApellido, string correo, string telefono, TipoUsuario tipoUsuario)
        {
            Id = id;
            Rut = rut;
            Password = password;
            PrimerNombre = primerNombre;
            SegundoNombre = segundoNombre;
            PrimerApellido = primerApellido;
            SegundoApellido = segundoApellido;
            Correo = correo;
            Telefono = telefono;
            TipoUsuario = tipoUsuario;
        }

        public Usuario()
        {

        }
        #endregion constructors
    }
}
