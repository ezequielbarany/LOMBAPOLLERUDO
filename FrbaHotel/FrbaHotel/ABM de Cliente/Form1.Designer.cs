namespace FrbaHotel.ABM_de_Cliente
{
    partial class Form1
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
            this.filtro_nombre = new System.Windows.Forms.TextBox();
            this.filtro_apellido = new System.Windows.Forms.TextBox();
            this.filtro_tipoIdentificacion = new System.Windows.Forms.ComboBox();
            this.filtro_numeroIdentificacion = new System.Windows.Forms.TextBox();
            this.filtro_email = new System.Windows.Forms.TextBox();
            this.labelNombre = new System.Windows.Forms.Label();
            this.labelApellido = new System.Windows.Forms.Label();
            this.labelTipoIdentificacion = new System.Windows.Forms.Label();
            this.labelNumeroIdentificacion = new System.Windows.Forms.Label();
            this.labelEmail = new System.Windows.Forms.Label();
            this.gridClientes = new System.Windows.Forms.DataGridView();
            this.button_buscar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // filtro_nombre
            // 
            this.filtro_nombre.Location = new System.Drawing.Point(66, 6);
            this.filtro_nombre.Name = "filtro_nombre";
            this.filtro_nombre.Size = new System.Drawing.Size(100, 20);
            this.filtro_nombre.TabIndex = 1;
            // 
            // filtro_apellido
            // 
            this.filtro_apellido.Location = new System.Drawing.Point(232, 6);
            this.filtro_apellido.Name = "filtro_apellido";
            this.filtro_apellido.Size = new System.Drawing.Size(100, 20);
            this.filtro_apellido.TabIndex = 2;
            // 
            // filtro_tipoIdentificacion
            // 
            this.filtro_tipoIdentificacion.FormattingEnabled = true;
            this.filtro_tipoIdentificacion.Location = new System.Drawing.Point(438, 9);
            this.filtro_tipoIdentificacion.Name = "filtro_tipoIdentificacion";
            this.filtro_tipoIdentificacion.Size = new System.Drawing.Size(121, 21);
            this.filtro_tipoIdentificacion.TabIndex = 3;
            // 
            // filtro_numeroIdentificacion
            // 
            this.filtro_numeroIdentificacion.Location = new System.Drawing.Point(143, 46);
            this.filtro_numeroIdentificacion.Name = "filtro_numeroIdentificacion";
            this.filtro_numeroIdentificacion.Size = new System.Drawing.Size(100, 20);
            this.filtro_numeroIdentificacion.TabIndex = 4;
            // 
            // filtro_email
            // 
            this.filtro_email.Location = new System.Drawing.Point(307, 46);
            this.filtro_email.Name = "filtro_email";
            this.filtro_email.Size = new System.Drawing.Size(100, 20);
            this.filtro_email.TabIndex = 5;
            // 
            // labelNombre
            // 
            this.labelNombre.AutoSize = true;
            this.labelNombre.Location = new System.Drawing.Point(12, 9);
            this.labelNombre.Name = "labelNombre";
            this.labelNombre.Size = new System.Drawing.Size(44, 13);
            this.labelNombre.TabIndex = 6;
            this.labelNombre.Text = "Nombre";
            // 
            // labelApellido
            // 
            this.labelApellido.AutoSize = true;
            this.labelApellido.Location = new System.Drawing.Point(182, 6);
            this.labelApellido.Name = "labelApellido";
            this.labelApellido.Size = new System.Drawing.Size(44, 13);
            this.labelApellido.TabIndex = 7;
            this.labelApellido.Text = "Apellido";
            // 
            // labelTipoIdentificacion
            // 
            this.labelTipoIdentificacion.AutoSize = true;
            this.labelTipoIdentificacion.Location = new System.Drawing.Point(338, 6);
            this.labelTipoIdentificacion.Name = "labelTipoIdentificacion";
            this.labelTipoIdentificacion.Size = new System.Drawing.Size(94, 13);
            this.labelTipoIdentificacion.TabIndex = 8;
            this.labelTipoIdentificacion.Text = "Tipo Identificación";
            // 
            // labelNumeroIdentificacion
            // 
            this.labelNumeroIdentificacion.AutoSize = true;
            this.labelNumeroIdentificacion.Location = new System.Drawing.Point(12, 46);
            this.labelNumeroIdentificacion.Name = "labelNumeroIdentificacion";
            this.labelNumeroIdentificacion.Size = new System.Drawing.Size(125, 13);
            this.labelNumeroIdentificacion.TabIndex = 9;
            this.labelNumeroIdentificacion.Text = "Número de Identificación";
            // 
            // labelEmail
            // 
            this.labelEmail.AutoSize = true;
            this.labelEmail.Location = new System.Drawing.Point(269, 46);
            this.labelEmail.Name = "labelEmail";
            this.labelEmail.Size = new System.Drawing.Size(32, 13);
            this.labelEmail.TabIndex = 10;
            this.labelEmail.Text = "Email";
            // 
            // gridClientes
            // 
            this.gridClientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridClientes.Location = new System.Drawing.Point(12, 134);
            this.gridClientes.MultiSelect = false;
            this.gridClientes.Name = "gridClientes";
            this.gridClientes.Size = new System.Drawing.Size(547, 255);
            this.gridClientes.TabIndex = 11;
            // 
            // button_buscar
            // 
            this.button_buscar.Location = new System.Drawing.Point(15, 88);
            this.button_buscar.Name = "button_buscar";
            this.button_buscar.Size = new System.Drawing.Size(75, 23);
            this.button_buscar.TabIndex = 12;
            this.button_buscar.Text = "Buscar";
            this.button_buscar.UseVisualStyleBackColor = true;
            this.button_buscar.Click += new System.EventHandler(this.button_buscar_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(574, 401);
            this.Controls.Add(this.button_buscar);
            this.Controls.Add(this.gridClientes);
            this.Controls.Add(this.labelEmail);
            this.Controls.Add(this.labelNumeroIdentificacion);
            this.Controls.Add(this.labelTipoIdentificacion);
            this.Controls.Add(this.labelApellido);
            this.Controls.Add(this.labelNombre);
            this.Controls.Add(this.filtro_email);
            this.Controls.Add(this.filtro_numeroIdentificacion);
            this.Controls.Add(this.filtro_tipoIdentificacion);
            this.Controls.Add(this.filtro_apellido);
            this.Controls.Add(this.filtro_nombre);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.gridClientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox filtro_nombre;
        private System.Windows.Forms.TextBox filtro_apellido;
        private System.Windows.Forms.ComboBox filtro_tipoIdentificacion;
        private System.Windows.Forms.TextBox filtro_numeroIdentificacion;
        private System.Windows.Forms.TextBox filtro_email;
        public System.Windows.Forms.Label labelNombre;
        public System.Windows.Forms.Label labelApellido;
        public System.Windows.Forms.Label labelTipoIdentificacion;
        public System.Windows.Forms.Label labelNumeroIdentificacion;
        public System.Windows.Forms.Label labelEmail;
        private System.Windows.Forms.DataGridView gridClientes;
        private System.Windows.Forms.Button button_buscar;
    }
}