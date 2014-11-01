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
            this.labelEstado = new System.Windows.Forms.Label();
            this.campo_estado = new System.Windows.Forms.TextBox();
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
            this.button_grabar.Location = new System.Drawing.Point(110, 222);
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
            // labelEstado
            // 
            this.labelEstado.AutoSize = true;
            this.labelEstado.Location = new System.Drawing.Point(12, 58);
            this.labelEstado.Name = "labelEstado";
            this.labelEstado.Size = new System.Drawing.Size(40, 13);
            this.labelEstado.TabIndex = 5;
            this.labelEstado.Text = "Estado";
            // 
            // campo_estado
            // 
            this.campo_estado.Location = new System.Drawing.Point(85, 51);
            this.campo_estado.Name = "campo_estado";
            this.campo_estado.Size = new System.Drawing.Size(100, 20);
            this.campo_estado.TabIndex = 4;
            // 
            // AltaModificacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(441, 383);
            this.Controls.Add(this.labelEstado);
            this.Controls.Add(this.campo_estado);
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
        private System.Windows.Forms.Label labelEstado;
        private System.Windows.Forms.TextBox campo_estado;
    }
}