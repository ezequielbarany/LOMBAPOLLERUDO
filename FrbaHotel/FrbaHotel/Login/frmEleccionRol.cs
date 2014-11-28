using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.Login
{
    public partial class frmEleccionRol : Form
    {
        private Usuario Usuario { get; set; }
        public Rol rolElegido { get; set; }

        public frmEleccionRol(Usuario usuario)
        {
            InitializeComponent();
            this.Usuario = usuario;
        }

        private void EleccionRol_Load(object sender, EventArgs e)
        {
            gridRol.DataSource = this.Usuario.Roles;
            this.gridRol.Columns["IdRol"].Visible = false;
            this.gridRol.Columns["Estado"].Visible = false;
        }

        private void gridRol_DoubleClick(object sender, EventArgs e)
        {
            int idRolSeleccionado = Convert.ToInt32(gridRol.SelectedCells[0].Value);
            this.rolElegido = new Rol(idRolSeleccionado);
            this.DialogResult = DialogResult.OK;
        }
    }
}
