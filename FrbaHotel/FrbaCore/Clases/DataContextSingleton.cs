using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace FrbaCore
{
    public class DataContextSingleton
    {
        //Singleton
        private static readonly DataContextSingleton connection = new DataContextSingleton();

        //Database conection
        private FrbaDataContextDataContext _dataContext;
     
        // Constructor privado para evitar la instanciación directa
        private DataContextSingleton()
        {
            string conection = ConfigurationManager.ConnectionStrings["FRBAHOTEL_DATABASE"].ConnectionString;
            _dataContext = new FrbaDataContextDataContext(conection);
        }
     
        // Propiedad para acceder a la instancia
        public static FrbaDataContextDataContext Connection
        {
            get
            {
                return connection._dataContext;
            }
        }
    }
}
