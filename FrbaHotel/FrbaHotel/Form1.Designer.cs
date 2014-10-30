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
            this.SuspendLayout();
            // 
            // ABM_Cliente
            // 
            this.ABM_Cliente.Location = new System.Drawing.Point(110, 66);
            this.ABM_Cliente.Name = "ABM_Cliente";
            this.ABM_Cliente.Size = new System.Drawing.Size(75, 23);
            this.ABM_Cliente.TabIndex = 0;
            this.ABM_Cliente.Text = "ABM Cliente";
            this.ABM_Cliente.UseVisualStyleBackColor = true;
            this.ABM_Cliente.Click += new System.EventHandler(this.ABM_Cliente_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.ABM_Cliente);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ABM_Cliente;
    }
}

