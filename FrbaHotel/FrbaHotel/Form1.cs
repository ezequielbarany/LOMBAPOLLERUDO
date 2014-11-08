using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void ABM_Cliente_Click(object sender, EventArgs e)
        {
            FrbaHotel.ABM_de_Cliente.Form1 form1 = new FrbaHotel.ABM_de_Cliente.Form1();
            form1.Show();
        }

        private void ABM_Roles_Click(object sender, EventArgs e)
        {
            FrbaHotel.ABM_de_Rol.Listado form1 = new FrbaHotel.ABM_de_Rol.Listado();
            form1.Show();
        }

        private void btnABMUsuario_Click(object sender, EventArgs e)
        {
            FrbaHotel.ABM_de_Usuario.frmABMUsuario frmUsuario = new FrbaHotel.ABM_de_Usuario.frmABMUsuario();
            frmUsuario.ShowDialog();
        }
    }
}
