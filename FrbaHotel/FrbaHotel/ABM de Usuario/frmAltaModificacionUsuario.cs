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
    public partial class frmAltaModificacionUsuario : Form
    {
        public frmAltaModificacionUsuario()
        {
            InitializeComponent();
            llenarListas();
        }

        public frmAltaModificacionUsuario(string username)
        {
            InitializeComponent();
            Usuario usuario = new Usuario(username);
            txtUsername.Text = usuario.username;
            txtPassword.Text = usuario.password;
            txtNombre.Text = usuario.nombre;
            txtApellido.Text = usuario.apellido;
            txtTipoDocumento.Text = usuario.tipoDocumento;
            txtNumeroDocumento.Text = usuario.documento;
            txtMail.Text = usuario.mail;
            txtTelefono.Text = usuario.tel;
            txtDireccion.Text = usuario.direccion;
            dtpFechaNacimiento.Value = (DateTime)usuario.fechaNacimiento;
            llenarListas();

            foreach (var rol in usuario.Roles)
            {
                if (this.chkListRoles.Items.Contains(rol))
                {
                    int index = this.chkListRoles.Items.IndexOf(rol);
                    this.chkListRoles.SetItemCheckState(index, CheckState.Checked);
                }
            }

            foreach (var hotel in usuario.Hoteles)
            {
                if (this.chkListHoteles.Items.Contains(hotel))
                {
                    int index = this.chkListHoteles.Items.IndexOf(hotel);
                    this.chkListHoteles.SetItemCheckState(index, CheckState.Checked);
                }
            }
        }

        private void llenarListas()
        {
            Rol auxRol = new Rol();

            foreach (var rol in auxRol.listarRoles())
            {
                this.chkListRoles.Items.Add(rol);
            }
            this.chkListRoles.DisplayMember = "nombre";

            Hotel auxHotel = new Hotel();

            foreach (Hotel hotel in auxHotel.listarHoteles())
            {
                this.chkListHoteles.Items.Add(hotel);
            }
            this.chkListHoteles.DisplayMember = "nombre";
            
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (validarDatos())
            {
                Usuario usuario = new Usuario();
                usuario.username = txtUsername.Text;
                usuario.password = txtPassword.Text;
                usuario.nombre = txtNombre.Text;
                usuario.apellido = txtApellido.Text;
                usuario.tipoDocumento = txtTipoDocumento.Text;
                usuario.documento = txtNumeroDocumento.Text;
                usuario.mail = txtMail.Text;
                usuario.tel = txtTelefono.Text;
                usuario.direccion = txtDireccion.Text;
                usuario.fechaNacimiento = dtpFechaNacimiento.Value;
                usuario.Roles = new List<Rol>();

                foreach (Rol rolSeleccionado in chkListRoles.CheckedItems)
                {
                    usuario.Roles.Add(rolSeleccionado);
                }

                usuario.Hoteles = new List<Hotel>();
                foreach (Hotel hotelSeleccionado in chkListHoteles.CheckedItems)
                {
                    usuario.Hoteles.Add(hotelSeleccionado);
                }

                usuario.grabar(usuario);
                this.DialogResult = DialogResult.OK;
            }
        }

        private bool validarDatos()
        {
            if (string.IsNullOrEmpty(txtUsername.Text))
                return false;

            return true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }
    }
}
