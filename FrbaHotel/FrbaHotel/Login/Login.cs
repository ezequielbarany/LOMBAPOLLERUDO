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
    public partial class Login : Form
    {
        private Usuario user { get; set; }
        public Rol rolElegido { get; set; }

        public Login()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (verificarUsuario())
            {
                //Si tiene un solo rol, entra directamente con ese.
                if (user.Roles.Count == 1)
                {
                    this.rolElegido = new Rol(user.Roles.First().idRol);
                }
                else
                {
                    frmEleccionRol frm = new frmEleccionRol(user);
                    frm.ShowDialog();
                    if (frm.DialogResult == DialogResult.OK)
                        this.rolElegido = frm.rolElegido;
                }

                this.DialogResult = DialogResult.OK;
            }
        }

        private bool verificarUsuario()
        {
            Usuario usuario = new Usuario();
            usuario = usuario.listarUsuarios().Where(x => x.username == txtUsuario.Text).FirstOrDefault();
            if (usuario == null)
                return false;

            usuario = new Usuario(usuario.username);
            if (usuario.password == txtPassword.Text)
            {
                this.user = usuario;
                usuario.reiniciarFallasLogin();
                return true;
            }
            else
            {
                usuario.fallaLogin();
                if (usuario.intentosFallidos >= 3)
                    usuario.darBaja();
            }

            return false;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
    }
}
