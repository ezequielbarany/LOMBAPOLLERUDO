using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore
{
    public partial class Usuario
    {
        //Add atributes
        public List<Rol> Roles { get; set; }
        public List<Hotel> Hoteles { get; set; }

        public Usuario()
        {
            this.Roles = new List<Rol>();
            this.Hoteles = new List<Hotel>();
        }

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

            //Llena los roles del usuario
            List<RolxUsuario> rolesPorUsuario = new List<RolxUsuario>();
            rolesPorUsuario = DataContextSingleton.Connection.RolxUsuario.Where(x => x.username == this.username).ToList();
            foreach (var rolPorUsuario in rolesPorUsuario)
            {
                Rol auxRol = DataContextSingleton.Connection.Rol.Where(x => x.idRol == rolPorUsuario.idRol).FirstOrDefault();
                this.Roles.Add(auxRol);
            }

            List<UsuarioxHotel> hotelesPorUsuario = new List<UsuarioxHotel>();
            hotelesPorUsuario = DataContextSingleton.Connection.UsuarioxHotel.Where(x => x.username == this.username).ToList();
            foreach (var hotelPorUsuario in hotelesPorUsuario)
            {
                Hotel auxHotel = DataContextSingleton.Connection.Hotel.Where(x => x.idHotel == hotelPorUsuario.idHotel).FirstOrDefault();
                this.Hoteles.Add(auxHotel);
            }
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
