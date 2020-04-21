using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace Infinity
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            try
            {
                // Code that runs on application startup
                RouteConfig.RegisterRoutes(RouteTable.Routes);
                BundleConfig.RegisterBundles(BundleTable.Bundles);
            }
            catch (Exception ex)
            {
                string message = "An error has occured in the application." + "\\nPlease check with your administrator for details.";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
                throw;
            }
            
        }
    }
}