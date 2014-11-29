using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.ABM_de_Usuario
{
    public partial class frmABMUsuario : Form
    {
        public frmABMUsuario()
        {
            InitializeComponent();

            this.refrescarGrilla();
        }

        private void btnAlta_Click(object sender, EventArgs e)
        {
            frmAltaModificacionUsuario frmAlta = new frmAltaModificacionUsuario();

            frmAlta.ShowDialog();
            this.refrescarGrilla();
        }

        private void btnBaja_Click(object sender, EventArgs e)
        {
            if (gridUsuarios.SelectedRows.Count == 1)
            {
                string usernameSeleccionado = gridUsuarios.SelectedCells[0].Value.ToString();
                Usuario usuario = new Usuario(usernameSeleccionado);
                usuario.darBaja();
                this.refrescarGrilla();
            }
        }

        private void gridUsuarios_Click(object sender, EventArgs e)
        {
            if (gridUsuarios.SelectedRows.Count == 1)
            {
                string usernameSeleccionado = gridUsuarios.SelectedCells[0].Value.ToString();
                frmAltaModificacionUsuario frmMod = new frmAltaModificacionUsuario(usernameSeleccionado);

                frmMod.ShowDialog();

                if (frmMod.DialogResult == DialogResult.OK)
                {
                    this.refrescarGrilla();
                }
            }
        }

        private void refrescarGrilla()
        {
            Usuario usuario = new Usuario();
            this.gridUsuarios.DataSource = usuario.listarUsuarios();
        }
    }
}
