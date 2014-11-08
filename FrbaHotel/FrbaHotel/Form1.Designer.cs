namespace FrbaHotel
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
            this.ABM_Cliente = new System.Windows.Forms.Button();
            this.ABM_Roles = new System.Windows.Forms.Button();
            this.btnABMUsuario = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ABM_Cliente
            // 
            this.ABM_Cliente.Location = new System.Drawing.Point(175, 118);
            this.ABM_Cliente.Name = "ABM_Cliente";
            this.ABM_Cliente.Size = new System.Drawing.Size(82, 23);
            this.ABM_Cliente.TabIndex = 0;
            this.ABM_Cliente.Text = "ABM Cliente";
            this.ABM_Cliente.UseVisualStyleBackColor = true;
            this.ABM_Cliente.Click += new System.EventHandler(this.ABM_Cliente_Click);
            // 
            // ABM_Roles
            // 
            this.ABM_Roles.Location = new System.Drawing.Point(175, 57);
            this.ABM_Roles.Name = "ABM_Roles";
            this.ABM_Roles.Size = new System.Drawing.Size(82, 23);
            this.ABM_Roles.TabIndex = 1;
            this.ABM_Roles.Text = "ABM Roles";
            this.ABM_Roles.UseVisualStyleBackColor = true;
            this.ABM_Roles.Click += new System.EventHandler(this.ABM_Roles_Click);
            // 
            // btnABMUsuario
            // 
            this.btnABMUsuario.Location = new System.Drawing.Point(175, 183);
            this.btnABMUsuario.Name = "btnABMUsuario";
            this.btnABMUsuario.Size = new System.Drawing.Size(82, 23);
            this.btnABMUsuario.TabIndex = 2;
            this.btnABMUsuario.Text = "ABM Usuario";
            this.btnABMUsuario.UseVisualStyleBackColor = true;
            this.btnABMUsuario.Click += new System.EventHandler(this.btnABMUsuario_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(576, 405);
            this.Controls.Add(this.btnABMUsuario);
            this.Controls.Add(this.ABM_Roles);
            this.Controls.Add(this.ABM_Cliente);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ABM_Cliente;
        private System.Windows.Forms.Button ABM_Roles;
        private System.Windows.Forms.Button btnABMUsuario;
    }
}

