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
            this.label1 = new System.Windows.Forms.Label();
            this.campo_habilitado = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.listaRoles = new System.Windows.Forms.CheckedListBox();
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
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 114);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(115, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "Funcionalidades del rol";
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
            this.label3.Location = new System.Drawing.Point(12, 86);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(151, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Asignación de funcionalidades";
            // 
            // listaRoles
            // 
            this.listaRoles.FormattingEnabled = true;
            this.listaRoles.Location = new System.Drawing.Point(15, 140);
            this.listaRoles.Name = "listaRoles";
            this.listaRoles.Size = new System.Drawing.Size(294, 274);
            this.listaRoles.TabIndex = 14;
            // 
            // AltaModificacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(788, 452);
            this.Controls.Add(this.listaRoles);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.campo_habilitado);
            this.Controls.Add(this.label1);
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
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.CheckBox campo_habilitado;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckedListBox listaRoles;
    }
}