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
        public Usuario user { get; set; }
        private int intentosFallidos { get; set; }

        public Login()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (verificarUsuario())
            {
                //Si lo es, habilitar los controles que corresponden.
                this.DialogResult = DialogResult.OK;
            }           
        }

        private bool verificarUsuario()
        {
            Usuario usuario = new Usuario();
            usuario = usuario.listarUsuarios().Where(x=> x.username == txtUsuario.Text).SingleOrDefault();
            if (usuario == null)
                return false;

            usuario = new Usuario(usuario.username);
            this.intentosFallidos = Convert.ToInt32(usuario.intentosFallidos == null ? 0 : usuario.intentosFallidos);
            if (usuario.password == txtPassword.Text)
            {
                this.user = usuario;
                return true;
            }
            else
            {
                this.intentosFallidos++;
                //Falta actualizar los de la base
                if (this.intentosFallidos >= 3)
                    usuario.darBaja();
            }

            return false;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
