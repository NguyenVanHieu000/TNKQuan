using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace KLTN
{
    public partial class frmMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void btnThongKeDiem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.guna2ContainerControl1.Controls.Clear();
            frmThongKeDiem frm = new frmThongKeDiem();
            frm.TopLevel = false;
            guna2ContainerControl1.Controls.Add(frm);
            frm.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            frm.Dock = DockStyle.Fill;
            frm.Show();
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.guna2ContainerControl1.Controls.Clear();
            frmTaoDotThi frm = new frmTaoDotThi();
            frm.TopLevel = false;
            guna2ContainerControl1.Controls.Add(frm);
            frm.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            frm.Dock = DockStyle.Fill;
            frm.Show();
        }

        private void btnSoanNHCH_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.guna2ContainerControl1.Controls.Clear();
            frmSoanNHCH frm = new frmSoanNHCH();
            frm.TopLevel = false;
            guna2ContainerControl1.Controls.Add(frm);
            frm.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            frm.Dock = DockStyle.Fill;
            frm.Show();
        }
    }
}
