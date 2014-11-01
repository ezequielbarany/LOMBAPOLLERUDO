namespace FrbaHotel.ABM_de_Rol
{
    partial class Listado
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.labelNombre = new System.Windows.Forms.Label();
            this.filtro_nombre = new System.Windows.Forms.TextBox();
            this.gridRol = new System.Windows.Forms.DataGridView();
            this.button_buscar = new System.Windows.Forms.Button();
            this.button_modificar = new System.Windows.Forms.Button();
            this.button_agregar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridRol)).BeginInit();
            this.SuspendLayout();
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.Location = new System.Drawing.Point(12, 9);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(44, 13);
            this.labelNombre.TabIndex = 0;
            this.labelNombre.Text = "Nombre";
            // 
            // filtro_nombre
            // 
            this.filtro_nombre.Location = new System.Drawing.Point(62, 9);
            this.filtro_nombre.Name = "filtro_nombre";
            this.filtro_nombre.Size = new System.Drawing.Size(100, 20);
            this.filtro_nombre.TabIndex = 3;
            // 
            // gridRol
            // 
            this.gridRol.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridRol.Location = new System.Drawing.Point(12, 76);
            this.gridRol.MultiSelect = false;
            this.gridRol.Name = "gridRol";
            this.gridRol.ReadOnly = true;
            this.gridRol.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridRol.Size = new System.Drawing.Size(625, 363);
            this.gridRol.TabIndex = 4;
            // 
            // button_buscar
            // 
            this.button_buscar.Location = new System.Drawing.Point(15, 35);
            this.button_buscar.Name = "button_buscar";
            this.button_buscar.Size = new System.Drawing.Size(75, 23);
            this.button_buscar.TabIndex = 5;
            this.button_buscar.Text = "Buscar";
            this.button_buscar.UseVisualStyleBackColor = true;
            this.button_buscar.Click += new System.EventHandler(this.button_buscar_Click);
            // 
            // button_modificar
            // 
            this.button_modificar.Location = new System.Drawing.Point(113, 35);
            this.button_modificar.Name = "button_modificar";
            this.button_modificar.Size = new System.Drawing.Size(75, 23);
            this.button_modificar.TabIndex = 6;
            this.button_modificar.Text = "Modificar";
            this.button_modificar.UseVisualStyleBackColor = true;
            this.button_modificar.Click += new System.EventHandler(this.button_modificar_Click);
            // 
            // button_agregar
            // 
            this.button_agregar.Location = new System.Drawing.Point(211, 35);
            this.button_agregar.Name = "button_agregar";
            this.button_agregar.Size = new System.Drawing.Size(75, 23);
            this.button_agregar.TabIndex = 7;
            this.button_agregar.Text = "Agregar";
            this.button_agregar.UseVisualStyleBackColor = true;
            this.button_agregar.Click += new System.EventHandler(this.button_agregar_Click);
            // 
            // Listado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(649, 442);
            this.Controls.Add(this.button_agregar);
            this.Controls.Add(this.button_modificar);
            this.Controls.Add(this.button_buscar);
            this.Controls.Add(this.gridRol);
            this.Controls.Add(this.filtro_nombre);
            this.Controls.Add(this.labelNombre);
            this.Name = "Listado";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.gridRol)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelNombre;
        private System.Windows.Forms.TextBox filtro_nombre;
        private System.Windows.Forms.DataGridView gridRol;
        private System.Windows.Forms.Button button_buscar;
        private System.Windows.Forms.Button button_modificar;
        private System.Windows.Forms.Button button_agregar;
    }
}