﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaCore;

namespace FrbaHotel.ABM_de_Hotel
{
    public partial class Listado : Form
    {
        public Listado()
        {
            InitializeComponent();

            Hotel auxHotel = new Hotel();
            this.gridHotel.DataSource = auxHotel.listarHoteles();
        }


    }
}
