using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Infinity
{
    public partial class WebFormTestUpdatePanel : System.Web.UI.Page
    {
        //private Label DateTimeLabel1 { get; set; }

        //private Label DateTimeLabel2 { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //DateTimeLabel1 = (Label)this.FindControl("DateTimeLable1");
            //DateTimeLabel2 = (Label)this.FindControl("DateTimeLable2");

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            DateTimeLabel1.Text = DateTime.Now.ToString();
            DateTimeLabel2.Text = DateTime.Now.ToString();
        }
    }
}