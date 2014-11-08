using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore
{
    public partial class Hotel
    {
        //Add atributes
        private List<HistorialHotel> historialHotel { get; set; }
        private List<Regimen> regimens { get; set; }
        private List<Habitacion> habitaciones { get; set; }

        //Constructors
        public Hotel()
        {
            historialHotel = new List<HistorialHotel>();
            regimens = new List<Regimen>();
            habitaciones = new List<Habitacion>();
        }

        public Hotel(int idHotel)
        {
            //Me traigo un hotel en particular
            Hotel dataBaseHotel = DataContextSingleton.Connection.Hotel.Where(x => x.idHotel == idHotel).FirstOrDefault();
            this.idHotel = dataBaseHotel.idHotel;
            this.nombre = dataBaseHotel.nombre;
            this.mail = dataBaseHotel.mail;
            this.telefono = dataBaseHotel.telefono;
            this.calle = dataBaseHotel.calle;
            this.nroCalle = dataBaseHotel.nroCalle;
            this.cantidadEstrellas = dataBaseHotel.cantidadEstrellas;
            this.ciudad = dataBaseHotel.ciudad;
            this.pais = dataBaseHotel.pais;
            this.recargaEstrella = dataBaseHotel.recargaEstrella;
            this.fechaCreacion = dataBaseHotel.fechaCreacion;

            this.historialHotel = new List<HistorialHotel>();
            this.regimens = new List<Regimen>();
            this.habitaciones = new List<Habitacion>();

            //Historial hotel
            historialHotel = DataContextSingleton.Connection.HistorialHotel.Where(x => x.idHotel == this.idHotel).ToList();

            //Regimens
            List<RegimenxHotel> regimenPorHotel = new List<RegimenxHotel>();
            regimenPorHotel = DataContextSingleton.Connection.RegimenxHotel.Where(x => x.idHotel == this.idHotel).ToList();
            foreach (var regimen in regimenPorHotel)
            {
                Regimen auxRegimen= DataContextSingleton.Connection.Regimen.Where(x => x.codigo == regimen.codigoRegimen).FirstOrDefault();
                this.regimens.Add(auxRegimen);
            }

            //Habitaciones
            habitaciones = DataContextSingleton.Connection.Habitacion.Where(x => x.idHotel == this.idHotel).ToList();

        }
     
        //Public methods
        public List<Hotel> listarHoteles()
        {
            return DataContextSingleton.Connection.Hotel.ToList();
        }




        public void baja(DateTime fechaDesde, DateTime fechaHasta, string motivo)
        {
            /*
            //SP=> Hotel_B(idHotel, fechaDesde, fechaHasta, motivo) -> no retorna
            var regHistorial = new HistorialHotel();
            regHistorial.idHotel = this._idHotel;
            regHistorial.fechaInicio= fechaDesde;
            regHistorial.fechaFin = fechaHasta;
            regHistorial.motivo = motivo;
            regHistorial.alta();
            this.agregarRegistroAlHistorial(regHistorial);*/
        }


      
    }
}
