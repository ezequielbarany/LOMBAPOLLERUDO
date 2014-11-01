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
    public partial class Listado : Form
    {
        public Listado()
        {
            InitializeComponent();

            //Lleno los campos de la grilla
            Rol rolAux = new Rol();
            
            this.gridRol.DataSource = rolAux.listarRoles();
        }

        //Buscar
        private void button_buscar_Click(object sender, EventArgs e)
        {
            //Busco con filtros
            Rol rolAux = new Rol();
            this.gridRol.DataSource = rolAux.listarRoles(this.filtro_nombre.Text);
        }

        //Modificar
        private void button_modificar_Click(object sender, EventArgs e)
        {
            //Obtengo id del rol seleccionado
            DataGridViewRow row = this.gridRol.SelectedRows[0];

            FrbaHotel.ABM_de_Rol.AltaModificacion form1 = new FrbaHotel.ABM_de_Rol.AltaModificacion(Int32.Parse(row.Cells["idRol"].Value.ToString()));
            form1.Show();

        }

        //Alta
        private void button_agregar_Click(object sender, EventArgs e)
        {
            FrbaHotel.ABM_de_Rol.AltaModificacion form1 = new FrbaHotel.ABM_de_Rol.AltaModificacion();
            form1.Show();
        }

        



    }
}
