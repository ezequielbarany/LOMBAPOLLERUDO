using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;


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
            this.baja = dataBaseUsuario.baja;
            this.Roles = new List<Rol>();
            this.Hoteles = new List<Hotel>();
            this.intentosFallidos = dataBaseUsuario.intentosFallidos;

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

        public List<Usuario> listarUsuarios()
        {
            return DataContextSingleton.Connection.Usuario.ToList().Where(x=> x.baja == false).ToList();
        }

        public void grabar(Usuario usuario)
        {
            DataTable tablaRoles = new DataTable();
            DataColumn idRoles = new DataColumn("idRol", typeof(int));
            tablaRoles.Columns.Add(idRoles);
            tablaRoles.Clear();

            foreach (var rol in usuario.Roles)
            {
                DataRow row = tablaRoles.NewRow();
                tablaRoles.Rows.Add(new object[] { rol.idRol });
                tablaRoles.Rows.Add(row);
            }
            
            DataTable tablaHoteles = new DataTable();
            DataColumn idHoteles = new DataColumn("idHotel", typeof(int));
            tablaHoteles.Columns.Add(idHoteles);
            tablaHoteles.Clear();

            foreach (var hotel in usuario.Hoteles)
            {
                DataRow row = tablaHoteles.NewRow();
                tablaHoteles.Rows.Add(new object[] { hotel.idHotel });
                tablaHoteles.Rows.Add(row);
            }

            DataContextSingleton.Connection.AltaModificacionUsuario(usuario, tablaRoles, tablaHoteles);
        }

        public void darBaja()
        {
            Usuario user = DataContextSingleton.Connection.Usuario.Where(x => x.username == this.username).FirstOrDefault();
            user.baja = true;
            DataContextSingleton.Connection.SubmitChanges();
        }

        public void fallaLogin() 
        {
            Usuario dataBaseUsuario = DataContextSingleton.Connection.Usuario.Where(x => x.username == this.username).FirstOrDefault();
            dataBaseUsuario.intentosFallidos++;
            DataContextSingleton.Connection.SubmitChanges();
        }

        public void reiniciarFallasLogin()
        {
            Usuario dataBaseUsuario = DataContextSingleton.Connection.Usuario.Where(x => x.username == this.username).FirstOrDefault();
            dataBaseUsuario.intentosFallidos = 0;
            DataContextSingleton.Connection.SubmitChanges();
        }
    }
}
