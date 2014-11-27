using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            DeshabilitarFuncionalidades();
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

        private void btnLogin_Click(object sender, EventArgs e)
        {
            FrbaHotel.Login.Login login = new FrbaHotel.Login.Login();
            login.ShowDialog();
            if (login.DialogResult == DialogResult.OK)
            {
                HabilitarFuncionalidades(login.user);
            }
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            DeshabilitarFuncionalidades();
        }

        private void HabilitarFuncionalidades(Usuario usuario)
        {
            if (usuario.TienePermiso())
            {
                btnABMUsuario.Enabled = true;
                ABM_Roles.Enabled = true;
                ABM_Cliente.Enabled = true;
            }
        }

        private void DeshabilitarFuncionalidades()
        {
            btnABMUsuario.Enabled = false;
            ABM_Roles.Enabled = false;
            ABM_Cliente.Enabled = false;
        }       
    }
}
