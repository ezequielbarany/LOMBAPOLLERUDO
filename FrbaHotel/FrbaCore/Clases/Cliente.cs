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
            string conection = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            _dataContext = new FrbaDataContextDataContext(conection);
        }

        //Methods
        public Cliente dameClientesSelect(){
            Cliente c1 = _dataContext.Cliente.FirstOrDefault();
            return c1;

        }


    }
}
