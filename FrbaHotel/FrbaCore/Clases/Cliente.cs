using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public partial class Cliente
    {
        private FrbaDataContextDataContext _dataContext;

        public Cliente()
        {
            string conection = "Data Source=localhost\\SQLSERVER2008;Initial Catalog=GD2C2014;User ID=gd;Password=gd2014";
            _dataContext = new FrbaDataContextDataContext(conection);
        }

        public Cliente dameClientesSelect(){
            Cliente c1 = _dataContext.Cliente.FirstOrDefault();
            return c1;

        }


    }
}
