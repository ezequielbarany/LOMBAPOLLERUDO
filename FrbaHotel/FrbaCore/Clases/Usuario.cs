using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore
{
    public partial class Usuario
    {
        public Usuario() { }

        public Usuario(string username)
        {
            Usuario dataBaseUsuario = DataContextSingleton.Connection.Usuario.Where(x => x.username == username).FirstOrDefault();
            this.username = dataBaseUsuario.username;
            this.password = dataBaseUsuario.password;
            this.nombre = dataBaseUsuario.nombre;
            this.apellido = dataBaseUsuario.apellido;
            this.tipoDocumento = dataBaseUsuario.tipoDocumento;
            this.documento = dataBaseUsuario.documento;
            this.mail = dataBaseUsuario.mail;
            this.tel = dataBaseUsuario.tel;
            this.direccion = dataBaseUsuario.direccion;
            this.fechaNacimiento = dataBaseUsuario.fechaNacimiento;
        }

        public void alta()
        {
            
        }

        public void modificacion(Usuario usuario)
        {
            
        }

        public void baja()
        {
            
        }

    }
}
