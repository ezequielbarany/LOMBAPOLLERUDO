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
        }

        private void frmAltaModificacionUsuario_Load(object sender, EventArgs e)
        {
            Rol rol = new Rol();
            ((ListBox)chkListRoles).ValueMember = "Id";
            ((ListBox)chkListRoles).DisplayMember = "Descipcion";
            ((ListBox)chkListRoles).DataSource = rol.listarRoles();
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

                foreach (DataRowView rolSeleccionado in chkListRoles.CheckedItems)
                {
                    Rol rol = new Rol((int)rolSeleccionado["Id"]);
                    usuario.Roles.Add(rol);
                }

                usuario.Hoteles = new List<Hotel>();
                foreach (DataRowView hotelSeleccionado in chkListHoteles.CheckedItems)
                {
                    Hotel hotel = new Hotel((int)hotelSeleccionado["Id"]);
                    usuario.Hoteles.Add(hotel);
                }

                usuario.grabar(usuario);
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
            this.Close();
        }


    }
}
