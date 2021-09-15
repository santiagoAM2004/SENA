using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Acti
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
        }

        

        public void savePeople()
        {
            License license = new License(txtnombre.Text, txtnumero.Text, txtapellido.Text, cmbGenero.Text, txtcargo.Text, 
                txt_tipodocu.Text, cmbSangre.Text,lblMostrar.Text,lblBarcode.Text);
            global.list.Add(license);
        }

        private void btn_insert_Click(object sender, EventArgs e)
        {
            OpenFileDialog abrir = new OpenFileDialog();
            abrir.Filter = "JPEG(*.JPG)|*.JPG|BMP(*.BMP)|*.BMP";
            if (abrir.ShowDialog() == DialogResult.OK)
            {
                pbfoto.Image = Image.FromFile(abrir.FileName);
            }

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName = openFileDialog1.FileName;
                lblMostrar.Text = fileName;
            }


        }

        private void button1_Click(object sender, EventArgs e)
        {

            savePeople();
            txtnombre.Text = "";
            txtapellido.Text = "";
            txtcargo.Text = "";
            txt_tipodocu.Text = "";
            cmbGenero.Text = "";
            cmbSangre.Text = "";
            txtnumero.Text = "";
            lblMostrar.Text = "";
            lblBarcode.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
        }

        private void btn_insert_barcode_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName = openFileDialog1.FileName;
                lblBarcode.Text = fileName;
            }

        }
    }
}

