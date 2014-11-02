using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore
{
    public partial class Funcionalidad
    {

        public Funcionalidad() { }

        public Funcionalidad(string nombre)
        {
            //Seteo funcionalidad
            Funcionalidad dataBaseFuncionalidad = DataContextSingleton.Connection.Funcionalidad.Where(x => x.descripcion.Equals(nombre)).FirstOrDefault();
            this.descripcion = dataBaseFuncionalidad.descripcion;
            this.idFuncionalidad = dataBaseFuncionalidad.idFuncionalidad;
        }



        public List<Funcionalidad> listarFuncionalidades()
        {
           return DataContextSingleton.Connection.Funcionalidad.ToList();
        }

    }
}
