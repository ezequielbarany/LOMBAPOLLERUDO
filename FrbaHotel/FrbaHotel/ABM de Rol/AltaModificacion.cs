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
            listarTodasLasFuncionalideades();

            foreach (var funcionalidad in rolATocar.funcionalidades)
            {
                if(this.listaRoles.Items.Contains(funcionalidad.descripcion)){
                    int index=this.listaRoles.Items.IndexOf(funcionalidad.descripcion);
                    this.listaRoles.SetItemCheckState(index, CheckState.Checked);
                }
            }
            
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
                this.listaRoles.Items.Add(funcionalidad.descripcion);
            }
        }
            
        private void button_grabar_Click(object sender, EventArgs e)
        {
            //Grabo las modificaciones o el alta
            rolATocar.nombre = this.campo_nombre.Text;
            rolATocar.estado = this.campo_habilitado.Checked;
            //Recupero las funcionalidades seleccionadas del rol
            rolATocar.funcionalidades = new List<Funcionalidad>();

            //for (int count = 0; count < this.listaRoles.Items.Count; count++)
            foreach (var item in this.listaRoles.CheckedItems)
            {
                Funcionalidad funcionalidadDataBase = new Funcionalidad(item.ToString());
                rolATocar.funcionalidades.Add(funcionalidadDataBase);
            }

            rolATocar.grabarRol(rolATocar);
            this.Close();
        }
    }
}
