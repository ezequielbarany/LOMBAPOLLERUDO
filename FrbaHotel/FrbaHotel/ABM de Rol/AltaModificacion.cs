using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.ABM_de_Rol
{
    public partial class AltaModificacion : Form
    {
        private Rol rolATocar { get; set; }

        //Modificacion
        public AltaModificacion(int id)
        {
            InitializeComponent();

            //Creo y asigno al rol de la clase
            rolATocar = new Rol(id);
            this.campo_id.Text = rolATocar.idRol.ToString();
            this.campo_nombre.Text = rolATocar.nombre;
        }

        //Alta
        public AltaModificacion()
        {
            InitializeComponent();

            //Creo y asigno al rol de la clase
            rolATocar = new Rol();
        }

        private void button_grabar_Click(object sender, EventArgs e)
        {
            //Grabo las modificaciones o el alta
            rolATocar.nombre = this.campo_nombre.Text;
            //srolATocar.estado = this.campo_estado.Text;
            rolATocar.grabarRol(rolATocar);
            this.Close();
        }

    }
}
