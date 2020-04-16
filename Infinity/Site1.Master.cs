using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
//using SecurityTracker.DataAccess.Admin;
//using SecurityTracker.BusinessModel.Admin;

namespace Infinity
{
    public partial class Site1 : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (String.IsNullOrEmpty(UserAuthorization.LogonId))
            //    Response.Redirect("~/login.aspx");

            //if (!this.IsPostBack)
            //{
            //    this.WelcomeLabel.Text = String.Concat("Welcome, ", UserAuthorization.DisplayName);
            //    if (UserAuthorization.IsAdminUser)
            //        ShowStatistics();
            //    else
            //    {
            //        TransactionCountLabel.Visible = false;
            //        ClientCountLabel.Visible = false;
            //    }

            //}

            string s = System.Web.HttpContext.Current.User.Identity.Name;

        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session["CurrentUser"] = null;
            FormsAuthentication.RedirectToLoginPage();
        }

        private void ShowStatistics()
        {
            try
            {
                //Statistics st;
                //if (Application["statistics"] == null)
                //    Application["statistics"] = StatisticsAccessor.GetStatistics();

                //st = (Statistics)Application["statistics"];
                //if (st != null)
                //{
                //    ClientCountLabel.Text = String.Concat("# of Individuals: ", st.ClientCount.ToString("###,###"));
                //    TransactionCountLabel.Text = String.Concat("# of Transactions: ", st.TransCount.ToString("###,###"));
                //}
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
    }
}