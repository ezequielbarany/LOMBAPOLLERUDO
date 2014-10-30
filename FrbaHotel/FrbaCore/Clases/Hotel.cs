using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrbaCore
{
    public partial class Hotel
    {/*
        public int idHotel { get; set; }
        public string nombre { get; set; }
        public string mail { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public int cantidadEstrellas { get; set; }
        public string ciudad { get; set; }
        public string pais { get; set; }
        public DateTime fechaCreacion { get; set; }*/
        private List<HistorialHotel> lHistoriaHotel { get; set; }
        private List<Regimen> lRegimen { get; set; }
        private List<Habitacion> lHabitacion { get; set; }

        #region Constructores
        public Hotel()
        {

        }

        public Hotel(int idHotel)
        {
            //SP=> Hotel_Datos(idHotel) -> retorna datos un hotel
        }
        #endregion

        #region Métodos públicos
        public void alta(Hotel hotel)
        {
            //SP=> Hotel_UI(nombre, mail, telefono, direccion, cantidadEstrellas, ciudad, pais, fechaCreacion) -> no retorna
            this.inicializarHotel();
        }

        public void modificacion()
        {
            //SP=> Hotel_UI(todos los datos de un hotel) -> no retorna
        }

        public void baja(DateTime fechaDesde, DateTime fechaHasta, string motivo)
        {
            //SP=> Hotel_B(idHotel, fechaDesde, fechaHasta, motivo) -> no retorna
            var regHistorial = new HistorialHotel();
            regHistorial.idHotel = this._idHotel;
            regHistorial.fechaInicio= fechaDesde;
            regHistorial.fechaFin = fechaHasta;
            regHistorial.motivo = motivo;
            regHistorial.alta();
            this.agregarRegistroAlHistorial(regHistorial);
        }

        public List<HistorialHotel> historialHotel()
        {
            return this.lHistoriaHotel;
        }
        #endregion

        #region Métodos privados
        private void inicializarHotel()
        {
            this.lHabitacion = new List<Habitacion>();
            this.lHistoriaHotel = new List<HistorialHotel>();
            this.lRegimen = new List<Regimen>();
            this.crearHabitaciones();
            this.crearRegimenes();
        }

        private void crearHabitaciones() 
        {
            
        }

        private void crearRegimenes()
        {
            
        }

        private void agregarRegistroAlHistorial(HistorialHotel regHistorial) 
        {
            this.lHistoriaHotel.Add(regHistorial);
        }

        #endregion
    }
}
