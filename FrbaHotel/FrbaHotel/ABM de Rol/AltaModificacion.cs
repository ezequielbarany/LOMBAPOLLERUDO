using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.ABM_de_Rol
{
    public partial class AltaModificacion : Form
    {
        private Rol rolATocar { get; set; }

        //Modificacion
        public AltaModificacion(int id)
        {
            InitializeComponent();

            //Creo y asigno al rol de la clase
            rolATocar = new Rol(id);
            this.campo_id.Text = rolATocar.idRol.ToString();
            this.campo_nombre.Text = rolATocar.nombre;
            this.campo_habilitado.Checked = (bool)rolATocar.estado;

            //Lista de funcionalidades ya cargadas
            foreach (var funcionalidad in rolATocar.funcionalidades)
            {
                this.lista_rolesDeRol.Items.Add(funcionalidad.descripcion);
            }
            listarTodasLasFuncionalideades();
        }

        //Alta
        public AltaModificacion()
        {
            InitializeComponent();

            //Creo y asigno al rol de la clase
            rolATocar = new Rol();
            listarTodasLasFuncionalideades();
        }

        private void listarTodasLasFuncionalideades()
        {
            Funcionalidad auxFuncionalidad = new Funcionalidad();
            foreach(var funcionalidad in auxFuncionalidad.listarFuncionalidades()){
                this.lista_rolesCargados.Items.Add(funcionalidad.descripcion);
            }
            
        }
            
        private void button_grabar_Click(object sender, EventArgs e)
        {
            //Grabo las modificaciones o el alta
            rolATocar.nombre = this.campo_nombre.Text;
            rolATocar.estado = this.campo_habilitado.Checked;
            //Recupero las funcionalidades seleccionadas del rol
            rolATocar.funcionalidades = new List<Funcionalidad>();
            for (int count = 0; count < this.lista_rolesDeRol.Items.Count; count++)
            {
                Funcionalidad funcionalidadDataBase = new Funcionalidad(this.lista_rolesDeRol.Items[count].ToString());
                rolATocar.funcionalidades.Add(funcionalidadDataBase);
            }

            rolATocar.grabarRol(rolATocar);
            this.Close();
        }

        //Agrego la funcionalidad seleccionada al rol en la lista
        private void button_agregarARol_Click(object sender, EventArgs e)
        {
            //Verifico que no este
            if(!this.lista_rolesDeRol.Items.Contains(this.lista_rolesCargados.SelectedItem)){
                this.lista_rolesDeRol.Items.Add(this.lista_rolesCargados.SelectedItem);
            }
        }

        //Saco la funcionalidad seleccionada del rol en la lista
        private void button_sacarDeRol_Click(object sender, EventArgs e)
        {
            this.lista_rolesDeRol.Items.Remove(this.lista_rolesDeRol.SelectedItem);
        }

    }
}
