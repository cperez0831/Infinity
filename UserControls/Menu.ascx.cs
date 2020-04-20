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

namespace Infinity.UserControls
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupTDAttributes();
                SetupPermissions();
            }
        }


        private void SetupPermissions()
        {
            //if (!UserAuthorization.IsSupervisor)
            //{
            //    this.AdminHyperLink.Visible = false;
            //    this.AuditHyperLink.Visible = false;
            //    this.tdAdmin.Visible = false;
            //    this.tdAudit.Visible = false;
            //    this.tdCampaign.Visible = false;

            //    this.tdMerge.Style["width"] = "280px";
            //    this.tdClientSelection.Style["width"] = "280px";
            //    this.tdReports.Style["width"] = "280px";
            //    this.tdEMailBatch.Style["width"] = "280px";
            //}
        }

        private void SetupTDAttributes()
        {
            //SetupTD(this.tdClientSelection, "ClientSelection.aspx");
            //SetupTD(this.tdAudit,"AuditPage.aspx");
            //SetupTD(this.tdAdmin, "Users.aspx");
            //SetupTD(this.tdReports, "QueryPage.aspx");
            //SetupTD(this.tdMerge, "Merge.aspx");
            //SetupTD(this.tdCampaign, "Campaign.aspx");
            //SetupTD(this.tdEMailBatch, "NotesBulkUpdate.aspx");
        }

        private void SetupTD(HtmlTableCell td, string pageName)
        {
            if (Request.Url.PathAndQuery.ToLower().Contains(pageName.ToLower()))
            {
                td.Style["background-color"] = "#9eae5a";
            }
            else
            {
                td.Attributes.Add("onmouseover", "selectItem(this);");
                td.Attributes.Add("onmouseout", "deSelectItem(this);");
            }


        }

      
    }
}