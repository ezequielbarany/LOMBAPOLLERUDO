namespace FrbaHotel.Login
{
    partial class frmEleccionRol
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
            this.gridRol = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.gridRol)).BeginInit();
            this.SuspendLayout();
            // 
            // gridRol
            // 
            this.gridRol.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridRol.Location = new System.Drawing.Point(12, 35);
            this.gridRol.MultiSelect = false;
            this.gridRol.Name = "gridRol";
            this.gridRol.ReadOnly = true;
            this.gridRol.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridRol.Size = new System.Drawing.Size(207, 129);
            this.gridRol.TabIndex = 0;
            this.gridRol.DoubleClick += new System.EventHandler(this.gridRol_DoubleClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(152, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Seleccionar un rol (doble click)";
            // 
            // frmEleccionRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(238, 180);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gridRol);
            this.Name = "frmEleccionRol";
            this.Text = "EleccionRol";
            this.Load += new System.EventHandler(this.EleccionRol_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridRol)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridRol;
        private System.Windows.Forms.Label label1;
    }
}