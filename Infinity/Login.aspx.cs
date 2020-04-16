using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.DirectoryServices;


namespace Infinity
{
    
    public partial class Login : System.Web.UI.Page
    {
        string srvr = "ldap://ktmc.com";
        string usr;
        string pwd; 
        protected void Page_Load(object sender, EventArgs e)
        {

            
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Main.aspx");
            //AuthenticateUser();
            if (!ValidateUser())
            {
                string message = "User " + usr + " not allowed." + "\\nPlease check with your administrator. ";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            } else
            {
                Response.Redirect("main.aspx");
            }
        }

        private bool AuthenticateUser()
        {
            bool authenticated = false;

            try
            {
                DirectoryEntry entry = new DirectoryEntry(srvr, usr, pwd);
                object nativeObject = entry.NativeObject;
                authenticated = true;
            }
            catch (DirectoryServicesCOMException cex)
            {
                //not authenticated; reason why is in cex
            }
            catch (Exception ex)
            {
                //not authenticated due to some other exception [this is optional]
            }
            return authenticated;
        }

        private bool ValidateUser()
        {
            Session["User"] = usr;
            Session["DisplayName"] = "";
            Session["Level"] = 0;
            bool authenticated = false;
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adp;
            SqlDataReader rdr;
            SqlParameter prm;
            DataSet ds = new DataSet();
            DataTable dt;
            DataRow dr;

            string cstr = ConfigurationManager.ConnectionStrings["InfinityDevConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(cstr);
            do
            {
                if (conn.State!=ConnectionState.Open) { conn.Open(); } else { break; }
            } while (true);
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ValidateUser";

            prm = new SqlParameter("@UserName", usr);
            prm.Direction = ParameterDirection.Input;
            prm.SqlDbType = SqlDbType.VarChar;
            prm.Size = 50;
            cmd.Parameters.Add(prm);

            prm = new SqlParameter("@DisplayName", "");
            prm.Direction = ParameterDirection.Output;
            prm.SqlDbType = SqlDbType.VarChar;
            prm.Size = 50;
            cmd.Parameters.Add(prm);

            prm = new SqlParameter("@Level", "");
            prm.Direction = ParameterDirection.Output;
            prm.SqlDbType = SqlDbType.Int;
            cmd.Parameters.Add(prm);

            cmd.ExecuteNonQuery();

            authenticated = cmd.Parameters["@DisplayName"].Value.ToString() != "Not Found" ? true : false;
            Session["DisplayName"] = cmd.Parameters["@DisplayName"].Value.ToString();
            Session["Level"] = cmd.Parameters["@Level"].Value.ToString();
            return authenticated;
        }

        protected void UserNameTextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            usr = txt.Text;
        }

        protected void PasswordTextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            pwd = txt.Text;
        }
    }
}
