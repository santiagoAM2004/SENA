using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Acti
{
    public partial class Form3 : Form

    {
        public string user = "SantiagoAriasM";
        public string passwoord = "123456789SAM";
        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void btnsignin_Click(object sender, EventArgs e)
        {
            if(txtuser.Text == user && txtpassword.Text == passwoord)
            {
                Form1 form1 = new Form1();
                Hide();
                form1.Show();
            }
        }

        private void txtuser_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
