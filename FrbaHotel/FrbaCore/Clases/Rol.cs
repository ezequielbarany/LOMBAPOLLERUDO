using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public partial class Rol
    {
        //Add atributes
        public List<Funcionalidad> funcionalidades { get; set; }

        //Constructors
        public Rol()
        {
            funcionalidades = new List<Funcionalidad>();
        }
        public Rol(int id)
        {
            //Me traigo un rol en particular
            Rol dataBaseRol = DataContextSingleton.Connection.Rol.Where(x => x.idRol == id).FirstOrDefault();
            this.estado = dataBaseRol.estado;
            this.idRol = dataBaseRol.idRol;
            this.nombre = dataBaseRol.nombre;
            this.funcionalidades = new List<Funcionalidad>();

            //Funcionalidades
            List<RolxFuncionalidad> rolPorFuncionalidades = new List<RolxFuncionalidad>();
            rolPorFuncionalidades= DataContextSingleton.Connection.RolxFuncionalidad.Where(x => x.idRol == dataBaseRol.idRol).ToList();
            foreach (var rolPorFuncionalidad in rolPorFuncionalidades)
            {
                Funcionalidad auxFuncionalidad=DataContextSingleton.Connection.Funcionalidad.Where(x => x.idFuncionalidad == rolPorFuncionalidad.idFuncionalidad).FirstOrDefault();
                this.funcionalidades.Add(auxFuncionalidad);
            }
            
        }

        //Public methods
        public List<Rol> listarRoles()
        {
           return DataContextSingleton.Connection.Rol.ToList();
        }

        public List<Rol> listarRoles(string nombre)
        {
            //Filtro por nombre
            return DataContextSingleton.Connection.Rol.Where(x => (nombre.Trim() == "" || x.nombre == nombre)).ToList();
        }

        public bool grabarRol(Rol rol)
        {
            Rol rolAGrabar=DataContextSingleton.Connection.Rol.Where(x => x.idRol == rol.idRol).FirstOrDefault();
            if (rolAGrabar == null)
            {
                //Nuevo rol

                //ACA VA EL STORE

                DataContextSingleton.Connection.Rol.InsertOnSubmit(rol);
            }
            else
            {
                //ACA VA EL STORE

                //Modificar rol
                rolAGrabar.nombre = rol.nombre;
                rolAGrabar.estado = rol.estado;
                rolAGrabar.funcionalidades = rol.funcionalidades;
            }
            DataContextSingleton.Connection.SubmitChanges();

            return true;
        }
        

    }
}
