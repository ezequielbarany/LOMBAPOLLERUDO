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

            List<Cliente> clientes = new List<Cliente>();
            clientes=clienteAux.dameClientesSelect();
            this.gridClientes.DataSource = clientes;
        }

        private void button_buscar_Click(object sender, EventArgs e)
        {
            Cliente clienteAux = new Cliente();

            List<Cliente> clientes = new List<Cliente>();
            //clientes = clienteAux.buscarClientes("cliente 1", this.filtro_apellido.ToString(), null, null, null);
            clientes = clienteAux.buscarClientes(this.filtro_nombre.Text,this.filtro_apellido.Text,this.filtro_tipoIdentificacion.Text,this.filtro_numeroIdentificacion.Text,this.filtro_email.Text);
            this.gridClientes.DataSource = clientes;
        }

        

 

  

    }
}
