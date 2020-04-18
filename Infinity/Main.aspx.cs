using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Infinity
{
    public partial class Main : System.Web.UI.Page
    {
        GridViewRow gvRow;
        string strRecNo;
        string strComp;
        string strDispName;
        int intLevel;
        DBUtil db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                try
                {
                    gvRow = (GridViewRow)Session["GridView"];
                    strRecNo = Session["RecNo"].ToString();
                    strComp = Session["Company"].ToString();
                    strDispName = Session["DisplayName"].ToString();
                    intLevel = Convert.ToInt32(Session["Level"].ToString());
                }
                catch (Exception)
                {

                    
                }
                
            }
        }

        protected void SelectRow(bool SW = true)
        {
            btnAdd01.Visible = !SW;
            btnAdd02.Visible = !SW;
            btnEdit01.Visible = SW;
            btnEdit02.Visible = SW;
            btnDelete01.Visible = SW;
            btnDelete02.Visible = SW;
            btnSave01.Visible = SW;
            btnSave02.Visible = SW;
            btnCancel01.Visible = SW;
            btnCancel02.Visible = SW;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvRow = gv.SelectedRow;
            strRecNo = gvRow.Cells[0].Text.ToString();
            strComp = gvRow.Cells[1].Text.ToString();
            Session["RecNo"] = strRecNo;
            Session["Company"] = strComp;
            Session["GridView"] = gvRow;
            //string message = "Record No: " + strRecNo + "\\nCompany Name: " + strComp;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            SelectRow();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check the item being bound is actually a DataRow, if it is, 
            //wire up the required html events and attach the relevant JavaScripts
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
                e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);"; 
                e.Row.Attributes["onclick"] =
                ClientScript.GetPostBackClientHyperlink(this.gv, "Select$" + e.Row.RowIndex);
            }
        }
        protected void GridView1_SelectedIndexChanged_old(object sender, EventArgs e)
        {
            GridViewRow gvRow = gv.SelectedRow;
            string strRecNo = gv.Columns[0].ToString();
        }
        protected void GridView1_RowDataBound_old(object sender, GridViewRowEventArgs e)
        {
            //check the item being bound is actually a DataRow, if it is, 
            //wire up the required html events and attach the relevant JavaScripts
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.color='red';";
                e.Row.Attributes["onmouseout"] = "this.style.color='black';";
                //e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
            }
        }
        protected void PopulateDataEntry()
        {
            txtIDInfinity.Text = strRecNo;
            DataSet ds = new DataSet("dsInifinity");
            String sConnStr = ConfigurationManager.ConnectionStrings["InfinityDevConnectionString"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(sConnStr))
            {
                SqlCommand cmd = new SqlCommand("GetInfinityData", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter prm = new SqlParameter("@RecNo", Convert.ToInt32(txtIDInfinity.Text.ToString()));
                prm.Direction = ParameterDirection.Input;
                prm.SqlDbType = SqlDbType.BigInt;
                cmd.Parameters.Add(prm);

                using (SqlDataAdapter adp = new SqlDataAdapter())
                {
                    adp.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        adp.Fill(dt);
                        DataRow dr = dt.Rows[0];
                        tdInvalidEnteries.Visible = false;
                        txtDefendant_Company.Text = dr["Defendant_Company"].ToString();
                        txtStatus_of_Case.Text = dr["Status_of_Case_Ex_ADST"].ToString();
                        txtYear_Filed.Text = dr["Year_Filed"].ToString();
                        txtLead_Case_Venue.Text = dr["Lead_Case_Venue"].ToString();
                        txtLead_Case_No.Text = dr["Lead_Case_No_Example_1100409"].ToString();
                        txtJudge_Assigned_to_Lead_Case.Text = dr["Judge_Assigned_to_Lead_Case"].ToString();
                        txtMagistrate_Judge.Text = dr["Magistrate_Judge"].ToString();
                        txtLead_Counsel_1.Text = dr["Lead_Counsel_1_"].ToString();
                        try
                        {
                            cboType_of_Case.Text = dr["Type_of_Case_10b_11_14e_14a"].ToString();

                        }
                        catch (Exception ex)
                        {
                            cboType_of_Case.BorderColor = Color.Red;
                            tdInvalidEnteries.Visible = true;
                            lblInvalidEntries.Visible = true;
                        }
                    }
                }
            }

        }
        protected void ButtonAdd(object sender, EventArgs e)
        {
            Session["RecNo"] = "";
            Session["Company"] = "";
        }
        protected void ButtonEdit(object sender, EventArgs e)
        {
            txtIDInfinity.Text = strRecNo;
            PopulateDataEntry();
        }
        protected void ButtonDelete(object sender, EventArgs e)
        {
            txtIDInfinity.Text = strRecNo;
            PopulateDataEntry();
        }

        protected void ButtonDeleteA(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                Session["RecNo"] = strRecNo;
                string message = "Current Record No: " + strRecNo + "\\nWill be deleted. " + strComp;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
                MarkRecordForDelete();
            }
            else
            {
                // do nothing
            }
        }

        protected void MarkRecordForDelete()
        {
            DBUtil dbc = new DBUtil();
            dbc.User = Session["User"].ToString();
            dbc.RecNo = Convert.ToInt32(txtIDInfinity.Text.ToString());
            dbc.DeleteRecord();
        }
        protected void ButtonSave(object sender, EventArgs e)
        {

        }
        protected void ButtonVerify(object sender, EventArgs e)
        {
            chkVerified.Checked = !chkVerified.Checked;
            hdnVerified.Value = chkVerified.Checked.ToString();
            btnVerify01.Text = chkVerified.Checked ?  "Unverify": "Verify";
            btnVerify02.Text = btnVerify01.Text;
            lblVerifiedBy.Visible = false;
            if (chkVerified.Checked)
            {
                lblVerifiedBy.Text = "&nbsp;By&nbsp;" + strDispName + "&nbsp;on&nbsp;" + DateTime.Today.ToShortDateString();
                lblVerifiedBy.Visible = true;
            }

        }

        protected void ButtonCancel(object sender, EventArgs e)
        {

        }

        protected void cboType_of_Case_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboLead_Plaintiff_Movant1_Type_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboAppointed_Lead_Plaintiff_Type_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboLargest_Loss_Appointed_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboCertClassPeriodYN_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboStipulationType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboSettlement_Stage_Examples_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboSettling_Parties_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}