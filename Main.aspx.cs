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
        bool SW;
        DBUtil db;
        string strArg;
        string strEvent;
        String sConnStr;
        string strUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            sConnStr = ConfigurationManager.ConnectionStrings["InfinityDevConnectionString"].ConnectionString;
            db = new DBUtil();

            if (Page.IsPostBack)
            {
                if (Request["__EVENTARGUMENT"] != null) { strArg = Request["__EVENTARGUMENT"]; }
                if (Request["__EVENTTARGET"] != null) { strEvent = Request["__EVENTTARGET"]; }
                try
                {
                    gvRow = (GridViewRow)Session["GridView"];
                    strRecNo = Session["RecNo"].ToString();
                    strComp = Session["Company"].ToString();
                    strDispName = Session["DisplayName"].ToString();
                    intLevel = Convert.ToInt32(Session["Level"].ToString());
                    db.RecNo = Convert.ToInt32(strRecNo);
                    db.User = Session["User"].ToString();
                    switch (strEvent)
                    {
                        case "DeletedRec":
                            MarkRecordForDelete();
                            break;
                        default:
                            break;
                    }
                }
                catch (Exception)
                {

                    
                }
                
            }
        }

        protected void SelectRow(bool SW = true)
        {   btnAdd01.Visible = !SW;
            btnEdit01.Visible = SW;
            btnDelete01.Visible = SW;
            btnDelete01A.Visible = !SW;
            btnSave01.Visible = SW;
            btnCancel01.Visible = SW;
            btnVerify01.Visible = !SW;
            MirrorButtons();
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

        

        
        protected void MirrorButtons()
        {
            btnAdd02.Visible = btnAdd01.Visible;
            btnEdit02.Visible = btnEdit01.Visible;
            btnDelete02.Visible = btnDelete01.Visible;
            btnDelete02A.Visible = btnDelete01A.Visible;
            btnSave02.Visible = btnSave01.Visible;
            btnVerify02.Visible = btnVerify01.Visible;
            btnCancel02.Visible = btnCancel01.Visible;
        }
        protected void ButtonAdd(object sender, EventArgs e)
        {
            SW = true;
            btnAdd01.Visible = !SW;
            btnEdit01.Visible = !SW;
            btnDelete01.Visible = !SW;
            btnDelete01A.Visible = !SW;
            btnSave01.Visible = SW;
            btnVerify01.Visible = !SW;
            btnCancel01.Visible = SW;
            MirrorButtons();
            pnlData.Visible = !SW;
            pnlMain.Visible = SW;

            db = new DBUtil();
            db.GetNextRecNo();
            strRecNo = db.NextRecordNo.ToString();
            Session["RecNo"] = strRecNo;
            Session["Company"] = "";
            if (strRecNo=="-1")
            {
                string message = "There is something wrong with the database server." + "\\nPlease try again later. ";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            } else
            {
                lblRecNo.Text = "New Record No.";
                lblRecNo.ForeColor = Color.Red;
                txtIDInfinity.ForeColor = Color.Red;
                txtIDInfinity.Text = strRecNo;
            }
        }
        protected void ButtonEdit(object sender, EventArgs e)
        {
            SW = true;
            btnAdd01.Visible = !SW;
            btnEdit01.Visible = !SW;
            btnDelete01.Visible = !SW;
            btnDelete01A.Visible = !SW;
            btnSave01.Visible = SW;
            btnVerify01.Visible = SW;
            btnCancel01.Visible = SW;
            MirrorButtons();
            pnlData.Visible = !SW;
            pnlMain.Visible = SW;

            txtIDInfinity.Text = strRecNo;
            PopulateDataEntry();
        }
        protected void ButtonDelete(object sender, EventArgs e)
        {
            SW = true;
            btnAdd01.Visible = !SW;
            btnEdit01.Visible = !SW;
            btnDelete01.Visible = !SW;
            btnDelete01A.Visible = SW;
            btnSave01.Visible = !SW;
            btnVerify01.Visible = !SW;
            btnCancel01.Visible = SW;
            MirrorButtons();
            pnlData.Visible = !SW;
            pnlMain.Visible = SW;

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
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "DeletedRec('" + message + "');", true);
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
            dbc.RecNo = Convert.ToInt32(strRecNo);
            dbc.DeleteRecord();
            RefreshPage();
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

        protected void RefreshPage()
        {
            Response.Redirect(Request.RawUrl);
        }
        protected void ButtonCancel(object sender, EventArgs e)
        {
            db = new DBUtil();
            db.RecNo = Convert.ToInt32(strRecNo);
            if (lblRecNo.ForeColor==Color.Red) { db.CancelThisRecord(); ; }
            RefreshPage();
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

        protected void txtDefendant_Company_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtStatus_of_Case_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtYear_Filed_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtFirst_Filed_Date_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtTermination_Date_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtLead_Case_Venue_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Defendant_Company";
            db.UpdateRecord();
        }

        protected void txtLead_Case_No_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "Lead_Case_No_Example_1100409";
            db.UpdateRecord();
        }

        protected void txtKTMC_Marketing_PlanDesignation_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txt.Text.ToString();
            db.FieldName = "KTMC_Marketing_PlanDesignation";
            db.UpdateRecord();
        }

        protected void txtFirst_Jurisdiction_Filed_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtFirst_Jurisdiction_No_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            db.FieldValue = txtFirst_Jurisdiction_Filed.Text + " - " + txt.Text.ToString();
            db.FieldName = "First_Jurisdiction_Filed_and_Number";
            db.UpdateRecord();
        }

        protected void txtSecond_Jurisdiction_Filed_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSecond_Jurisdiction_No_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThird_Jurisdiction_Filed_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThird_Jurisdiction_No_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFourth_Jurisdiction_Filed_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFourth_Jurisdiction_No_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFirst_Press_Release_Date_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLead_Plaintiff_Deadline_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLP_Appointment_Date_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAppointed_Lead_Plaintiff_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJudge_that_Appointed_LP_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtJudge_Assigned_to_Lead_Case_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtMagistrate_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLead_Counsel_1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLead_Counsel_2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLead_Counsel_3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLead_Counsel_4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAppointed_Local_Liaison_Counsel_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAppointed_Additional_Counsel_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCorporate_Defense_Counsel_1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAttorney_for_Corporate_Defense_Counsel_1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCorporate_Defense_Counsel_2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAttorney_for_Corporate_Defense_Counsel_2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCorporate_Defense_Counsel_3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAttorney_for_Corporate_Defense_Counsel_3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCorporate_Defense_Counsel_4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAttorney_for_Corporate_Defense_Counsel_4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtKTMC_Internal_Case_No_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtInitial_Damage_Estimate_from_60day_list_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_of_Order_on_1st_MTD_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_of_Order_on_2nd_MTD_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_of_Order_on_3rd_MTD_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_of_Class_Cert_Decision_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtClass_Cert_Result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtClass_Cert_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Period_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtStipulation_of_Settlement_Filed_Date_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSettlement_Hearing_Date_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSettling_Lead_Plaintiffs_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFinal_Settlement_Date_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSettlement_Amount_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSettlement_Attorneys_Fees_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtRequested_Attorneys__Fee_Percentage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAttorneys_Fee_Percentage_Awarded_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtFee_Lodestar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSettlement_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtMediator_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Defendant_Insurer_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Representative1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Representative2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Representative3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Representative4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCertified_Class_Representative5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_KTMC_paid_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDefendant_Underwriter_TextChanged(object sender, EventArgs e)
        {

        }
    }
}