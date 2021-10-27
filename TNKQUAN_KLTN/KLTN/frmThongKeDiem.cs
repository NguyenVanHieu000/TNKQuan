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
    public partial class frmThongKeDiem : DevExpress.XtraEditors.XtraForm
    {
        public event EventHandler Resize;
        public frmThongKeDiem()
        {
            InitializeComponent();
            CollapseMenu();
            btnSDTK.Hide();
            btnDLTK.Hide();
            btnMenu.Width = panel3.Width;
            ptAVT.SizeMode = PictureBoxSizeMode.CenterImage;
            panelTT.Hide();
        }

        private void frmThongKeDiem_Load(object sender, EventArgs e)
        {
           
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {
            //panel2.Dock = DockStyle.Fill;
        }

        private void CollapseMenu()
        {
            if (this.panel1.Width > 190) //Collapse menu
            {
                panel1.Width = 55;
                btnMenu.Dock = DockStyle.Top;

                btnDLTK.Hide();
                btnSDTK.Hide();

                btnXemAVT.Hide();

                btnThongKe.Text = "";

                foreach (Button menuButton in panel1.Controls.OfType<Button>())
                {
                    menuButton.ImageAlign = ContentAlignment.MiddleCenter;
                    menuButton.Padding = new Padding(0);
                }
            }
            else
            { //Expand menu
                panel1.Width = 200;
                btnMenu.Dock = DockStyle.None;

                btnThongKe.Text = "Thống kê";

                btnXemAVT.Show();

                foreach (Button menuButton in panel1.Controls.OfType<Button>())
                {
                    menuButton.ForeColor = System.Drawing.Color.White;
                    menuButton.Text = menuButton.Text;
                }
            }
        }

        private void guna2PictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }
        
        private void btnThongKe_Click(object sender, EventArgs e)
        {
            if (panel1.Width != 55)
            {
                if (btnDLTK.Visible == false)
                {
                    btnSDTK.Show();
                    btnDLTK.Show();
                }
                else
                {
                    btnDLTK.Hide();
                    btnSDTK.Hide();
                }
            }
            else
            {
                btnDLTK.Hide();
                btnSDTK.Hide();
            }
        }

        private void btnSDTK_Click_1(object sender, EventArgs e)
        {
            this.panel2.Controls.Clear();
            frmSDTK frm = new frmSDTK();
            frm.TopLevel = false;
            frm.AutoScroll = true;
            frm.Dock = DockStyle.Fill;
            this.panel2.Controls.Add(frm);
            frm.Show();
        }

        private void btnDLTK_Click(object sender, EventArgs e)
        {
            this.panel2.Controls.Clear();
            frmDLTK frm = new frmDLTK();
            frm.TopLevel = false;
            frm.AutoScroll = true;
            frm.Dock = DockStyle.Fill;
            this.panel2.Controls.Add(frm);
            frm.Show();
        }

        private void btnMenu_Click_1(object sender, EventArgs e)
        {
            CollapseMenu();
        }

        private void AVT_Click(object sender, EventArgs e)
        {

        }

        private void panel6_Resize(object sender, EventArgs e)
        {

        }

        private void btnXemAVT_Click(object sender, EventArgs e)
        {
            if (panelTT.Visible == false)
                panelTT.Show();
            else
                panelTT.Hide();
        }

       
    }
}