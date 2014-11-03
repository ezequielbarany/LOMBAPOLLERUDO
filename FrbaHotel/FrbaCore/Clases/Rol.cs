﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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
            //Cargo las funcionalidades en la datatble
            DataTable dataTableFuncionalidades=new DataTable();

            DataColumn idFuncionalidad = new DataColumn("idFuncionalidad", typeof(int));
            dataTableFuncionalidades.Columns.Add(idFuncionalidad);

            dataTableFuncionalidades.Clear();
            foreach(var funcionalidad in rol.funcionalidades){
                DataRow row = dataTableFuncionalidades.NewRow();
                dataTableFuncionalidades.Rows.Add(new object[] { funcionalidad.idFuncionalidad });
                dataTableFuncionalidades.Rows.Add(row);
            }
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["FRBAHOTEL_DATABASE"].ConnectionString);
            SqlCommand cmd = new SqlCommand("dbo.AltaModificacionRol",conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter dataTableRolXFuncionalidadParameter = new SqlParameter("@idFuncionalidadList", dataTableFuncionalidades);
            dataTableRolXFuncionalidadParameter.SqlDbType = SqlDbType.Structured;
            
            cmd.Parameters.Add("@idRol",SqlDbType.Int).Value=rol.idRol;
            cmd.Parameters.Add("@nombre",SqlDbType.NVarChar).Value=rol.nombre;
            cmd.Parameters.Add("@estado", SqlDbType.Bit).Value=rol.estado;
            cmd.Parameters.Add(dataTableRolXFuncionalidadParameter);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            return true;
        }
        

    }
}
