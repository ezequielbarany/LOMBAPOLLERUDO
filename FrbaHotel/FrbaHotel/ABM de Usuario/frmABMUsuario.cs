using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.ABM_de_Usuario
{
    public partial class frmABMUsuario : Form
    {
        public frmABMUsuario()
        {
            InitializeComponent();
        }

        private void btnAlta_Click(object sender, EventArgs e)
        {
            frmAltaModificacionUsuario frmAltaMod = new frmAltaModificacionUsuario();

            frmAltaMod.ShowDialog();
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {

        }

        private void gridUsuarios_Click(object sender, EventArgs e)
        {
            if (gridUsuarios.SelectedRows.Count == 1)
            {
                int idSeleccionado = (int)gridUsuarios.SelectedCells[0].Value;

            }
        }
    }
}
