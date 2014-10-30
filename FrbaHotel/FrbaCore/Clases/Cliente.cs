using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public partial class Cliente
    {
        //Database conection
        private FrbaDataContextDataContext _dataContext;

        //Add atributes
        private List<Reserva> reservas { get; set; }

        //Contructors
        public Cliente()
        {
            //string conection = ConfigurationManager.ConnectionStrings["FRBAHOTEL_DATABASE"].ConnectionString;
            string conection = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            _dataContext = new FrbaDataContextDataContext(conection);
        }

        public Cliente(decimal _numeroIdentificacion,int _tipoIdentificacion)
        {
            //string conection = ConfigurationManager.ConnectionStrings["FRBAHOTEL_DATABASE"].ConnectionString;
            string conection = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            _dataContext = new FrbaDataContextDataContext(conection);
            //Seteo cliente
            //SP busca cliente
        }

        //Methods
        public Cliente dameClientesSelect(){
            Cliente c1 = _dataContext.Cliente.FirstOrDefault();
            return c1;

        }


    }
}
