using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.ABM_de_Cliente
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            //Lleno los campos de la grilla
            Cliente clienteAux = new Cliente();

            this.gridClientes.DataSource = clienteAux.listarClientes();
        }

        //Buscar
        private void button_buscar_Click(object sender, EventArgs e)
        {
            //Busco con filtros
            Cliente clienteAux = new Cliente();
            //clientes = clienteAux.buscarClientes(this.filtro_nombre.Text,this.filtro_apellido.Text,this.filtro_tipoIdentificacion.Text,this.filtro_numeroIdentificacion.Text,this.filtro_email.Text);
            this.gridClientes.DataSource = clienteAux.listarClientes(this.filtro_nombre.Text, this.filtro_apellido.Text, this.filtro_tipoIdentificacion.Text, this.filtro_numeroIdentificacion.Text, this.filtro_email.Text);
        }






        /*
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
        }*/

        

  

    }
}
