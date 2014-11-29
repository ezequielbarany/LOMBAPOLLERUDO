using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public partial class Cliente
    {

        //Constructors
        public Cliente()
        {
        }

        public Cliente(decimal _numeroIdentificacion, int _tipoIdentificacion)
        {
            //Me traigo un cliente en particular
            Cliente dataBaseCliente = DataContextSingleton.Connection.Cliente.Where(x => x.numeroIdentificacion == _numeroIdentificacion && x.tipoIdentificacion == _tipoIdentificacion).FirstOrDefault();
            this.numeroIdentificacion = dataBaseCliente.numeroIdentificacion;
            this.tipoIdentificacion = dataBaseCliente.tipoIdentificacion;
            this.nombre = dataBaseCliente.nombre;
            this.apellido = dataBaseCliente.apellido;
            this.fechaNacimiento = dataBaseCliente.fechaNacimiento;
            this.mail = dataBaseCliente.mail;
            this.direccion = dataBaseCliente.direccion;
            this.altura = dataBaseCliente.altura;
            this.piso = dataBaseCliente.piso;
            this.depto = dataBaseCliente.depto;
            this.nacionalidad = dataBaseCliente.nacionalidad;
            this.telefono = dataBaseCliente.telefono;
            this.localidad = dataBaseCliente.localidad;
            this.habilitado = dataBaseCliente.habilitado;
        }

        //Public methods
        public List<Cliente> listarClientes()
        {
           return DataContextSingleton.Connection.Cliente.ToList();
        }

        public List<Cliente> listarClientes(string nombre, string apellido, string tipoIdentificacion, string numeroIdentificacion, string email)
        {
            //return DataContextSingleton.Connection.Cliente.Where(x => x.nombre.Equals(nombre)).ToList();
            return DataContextSingleton.Connection.Cliente.Where(x => (nombre.Trim() == "" || x.nombre == nombre) && (apellido.Trim() == "" || x.apellido == apellido)).ToList();
        }


        /*
        //Methods
        public List<Cliente> dameClientesSelect(){
            List<Cliente> c1 = DataContextSingleton.Connection.Cliente.ToList();
            return c1;

        }*/




    }
}
