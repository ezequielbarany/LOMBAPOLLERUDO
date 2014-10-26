using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore.Clases
{
    public class HistorialHotel
    {
        public int idHotel { get; set; }
        public DateTime fechaDesde { get; set; }
        public DateTime fechaHasta { get; set; }
        public string motivo { get; set; }

        public void alta()
        {
            //SP=> HistoriaHotel_I(idHotel, fechaDesde, fechaHasta, motivo)
        }
    }
}
