using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public partial class Cliente
    {
        //Add atributes
        private List<Reserva> reservas { get; set; }

        //Contructors
        public Cliente()
        {
        }
        /*
        public Cliente(decimal _numeroIdentificacion,int _tipoIdentificacion)
        {
            //string conection = ConfigurationManager.ConnectionStrings["FRBAHOTEL_DATABASE"].ConnectionString;
            string conection = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            _dataContext = new FrbaDataContextDataContext(conection);
            //Seteo cliente
            //SP busca cliente
        }*/

        //Methods
        public List<Cliente> dameClientesSelect(){
            List<Cliente> c1 = DataContextSingleton.Connection.Cliente.ToList();
            return c1;

        }

        public List<Cliente> buscarClientes(string nombre,string apellido,string tipoIdentificacion,string numeroIdentificacion,string email)
        {
            //Aca iria el sp
            return DataContextSingleton.Connection.Cliente.Where(x => x.nombre.Equals(nombre)).ToList();
        }


    }
}
