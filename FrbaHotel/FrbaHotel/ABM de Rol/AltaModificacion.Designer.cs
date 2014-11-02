namespace FrbaHotel.ABM_de_Rol
{
    partial class AltaModificacion
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
            this.campo_nombre = new System.Windows.Forms.TextBox();
            this.labelNombre = new System.Windows.Forms.Label();
            this.button_grabar = new System.Windows.Forms.Button();
            this.campo_id = new System.Windows.Forms.TextBox();
            this.lista_rolesDeRol = new System.Windows.Forms.ListBox();
            this.lista_rolesCargados = new System.Windows.Forms.ListBox();
            this.button_agregarARol = new System.Windows.Forms.Button();
            this.button_sacarDeRol = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.campo_habilitado = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // campo_nombre
            // 
            this.campo_nombre.Location = new System.Drawing.Point(85, 8);
            this.campo_nombre.Name = "campo_nombre";
            this.campo_nombre.Size = new System.Drawing.Size(100, 20);
            this.campo_nombre.TabIndex = 0;
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.Location = new System.Drawing.Point(12, 15);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(44, 13);
            this.labelNombre.TabIndex = 1;
            this.labelNombre.Text = "Nombre";
            // 
            // button_grabar
            // 
            this.button_grabar.Location = new System.Drawing.Point(515, 15);
            this.button_grabar.Name = "button_grabar";
            this.button_grabar.Size = new System.Drawing.Size(75, 23);
            this.button_grabar.TabIndex = 2;
            this.button_grabar.Text = "Grabar";
            this.button_grabar.UseVisualStyleBackColor = true;
            this.button_grabar.Click += new System.EventHandler(this.button_grabar_Click);
            // 
            // campo_id
            // 
            this.campo_id.Location = new System.Drawing.Point(228, 8);
            this.campo_id.Name = "campo_id";
            this.campo_id.Size = new System.Drawing.Size(100, 20);
            this.campo_id.TabIndex = 3;
            this.campo_id.Visible = false;
            // 
            // lista_rolesDeRol
            // 
            this.lista_rolesDeRol.FormattingEnabled = true;
            this.lista_rolesDeRol.Location = new System.Drawing.Point(12, 163);
            this.lista_rolesDeRol.Name = "lista_rolesDeRol";
            this.lista_rolesDeRol.Size = new System.Drawing.Size(244, 277);
            this.lista_rolesDeRol.TabIndex = 6;
            // 
            // lista_rolesCargados
            // 
            this.lista_rolesCargados.FormattingEnabled = true;
            this.lista_rolesCargados.Location = new System.Drawing.Point(332, 163);
            this.lista_rolesCargados.Name = "lista_rolesCargados";
            this.lista_rolesCargados.Size = new System.Drawing.Size(247, 277);
            this.lista_rolesCargados.TabIndex = 7;
            // 
            // button_agregarARol
            // 
            this.button_agregarARol.Location = new System.Drawing.Point(272, 201);
            this.button_agregarARol.Name = "button_agregarARol";
            this.button_agregarARol.Size = new System.Drawing.Size(44, 23);
            this.button_agregarARol.TabIndex = 8;
            this.button_agregarARol.Text = "<";
            this.button_agregarARol.UseVisualStyleBackColor = true;
            this.button_agregarARol.Click += new System.EventHandler(this.button_agregarARol_Click);
            // 
            // button_sacarDeRol
            // 
            this.button_sacarDeRol.Location = new System.Drawing.Point(272, 245);
            this.button_sacarDeRol.Name = "button_sacarDeRol";
            this.button_sacarDeRol.Size = new System.Drawing.Size(44, 23);
            this.button_sacarDeRol.TabIndex = 9;
            this.button_sacarDeRol.Text = ">";
            this.button_sacarDeRol.UseVisualStyleBackColor = true;
            this.button_sacarDeRol.Click += new System.EventHandler(this.button_sacarDeRol_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 137);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(115, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "Funcionalidades del rol";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(329, 137);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 13);
            this.label2.TabIndex = 11;
            this.label2.Text = "Todas las funcionalidades";
            // 
            // campo_habilitado
            // 
            this.campo_habilitado.AutoSize = true;
            this.campo_habilitado.Location = new System.Drawing.Point(15, 34);
            this.campo_habilitado.Name = "campo_habilitado";
            this.campo_habilitado.Size = new System.Drawing.Size(95, 17);
            this.campo_habilitado.TabIndex = 12;
            this.campo_habilitado.Text = "Está habilitado";
            this.campo_habilitado.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(206, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(151, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Asignación de funcionalidades";
            // 
            // AltaModificacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(602, 452);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.campo_habilitado);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button_sacarDeRol);
            this.Controls.Add(this.button_agregarARol);
            this.Controls.Add(this.lista_rolesCargados);
            this.Controls.Add(this.lista_rolesDeRol);
            this.Controls.Add(this.campo_id);
            this.Controls.Add(this.button_grabar);
            this.Controls.Add(this.labelNombre);
            this.Controls.Add(this.campo_nombre);
            this.Name = "AltaModificacion";
            this.Text = "AM";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox campo_nombre;
        private System.Windows.Forms.Label labelNombre;
        private System.Windows.Forms.Button button_grabar;
        private System.Windows.Forms.TextBox campo_id;
        private System.Windows.Forms.ListBox lista_rolesDeRol;
        private System.Windows.Forms.ListBox lista_rolesCargados;
        private System.Windows.Forms.Button button_agregarARol;
        private System.Windows.Forms.Button button_sacarDeRol;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox campo_habilitado;
        private System.Windows.Forms.Label label3;
    }
}