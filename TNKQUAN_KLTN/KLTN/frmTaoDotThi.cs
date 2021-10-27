using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace KLTN
{
    public partial class frmTaoDotThi : DevExpress.XtraEditors.XtraForm
    {
        public frmTaoDotThi()
        {
            InitializeComponent();
            guna2ComboBox1.Size = guna2ComboBox2.Size = guna2ComboBox3.Size = guna2ComboBox4.Size = guna2DateTimePicker1.Size = guna2TextBox3.Size = guna2TextBox5.Size = new Size(200, 36);
        }

        private void frmTaoDotThi_Load(object sender, EventArgs e)
        {

        }
    }
}