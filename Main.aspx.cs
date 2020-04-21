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
            btnDelete01.Visible = SW;
            btnSave01.Visible = SW;
            btnCancel01.Visible = SW;
            btnVerify01.Visible = !SW;
            MirrorButtons();
            pnlData.Visible = !SW;
            pnlMain.Visible = SW;
            txtIDInfinity.Text = strRecNo;
            PopulateDataEntry();
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
            btnDelete02.Visible = btnDelete01.Visible;
            btnSave02.Visible = btnSave01.Visible;
            btnVerify02.Visible = btnVerify01.Visible;
            btnCancel02.Visible = btnCancel01.Visible;
        }

        protected void ButtonAdd(object sender, EventArgs e)
        {
            
            SW = true;
            btnAdd01.Visible = !SW;
            btnDelete01.Visible = !SW;
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
        
        protected void ButtonDelete(object sender, EventArgs e)
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
            DataTable dt = new DataTable("InfinityDataTable");
            string[] ColumnNamesString = new string[] {"Defendant_Company", "Status_of_Case_Ex_ADST", "Year_Filed", 
                "Lead_Case_Venue", "Type_of_Case_10b_11_14e_14a", "Lead_Case_No_Example_1100409", "First_Jurisdiction_Filed_and_Number", "KTMC_Marketing_PlanDesignation",
                "Second_Jurisdiction_Filed_and_Number", "Third_Jurisdiction_Filed_and_Number", "Fourth_Jurisdiction_Filed_and_Number",
                "Lead_Plaintiff_Deadline", "Lead_Plaintiff_Movant1_Type_InsitutionalIndividualMixed", "Appointed_Lead_Plaintiff",
                "Appointed_Lead_Plaintiff_Type_EX_Individual_Institution_Group_of", "Largest_Loss_Appointed_YesNo", "Judge_that_Appointed_LP", "Judge_Assigned_to_Lead_Case",
                "Magistrate_Judge", "Lead_Counsel_1_", "Lead_Counsel_2", "Lead_Counsel_3", "Lead_Counsel_4", "Appointed_Local_Liaison_Counsel", "Appointed_Additional_Counsel",
                "Corporate_Defense_Counsel_1_", "Attorney_for_Corporate_Defense_Counsel_1", "Corporate_Defense_Counsel_2", "Attorney_for_Corporate_Defense_Counsel_2",
                "Corporate_Defense_Counsel_3", "Attorney_for_Corporate_Defense_Counsel_3", "Corporate_Defense_Counsel_4", "KTMC_Internal_Case_No", "Initial_Damage_Estimate_from_60day_list",
                "LP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t", "The_1st_MTD_Result", "The_1st_MTD_Judge",
                "The_2nd_MTD_Result", "The_2nd_MTD_Judge", "The_3rd_MTD_Result", "The_3rd_MTD_Judge", "Class_Cert_Result",
                "Class_Cert_Judge", "Certified_Class_Period", "Is_Certified_Class_Period_Same_as_Original_Class_Period_YN", "Settlement_Type_cash_stock_mixed",
                "Settlement_Stage_Examples_Motion_to_dismiss_summary_judgment_cla", "Settling_Lead_Plaintiffs", "Settlement_Amount",
                "Settlement_Attorneys_Fees_", "Requested_Attorneys__Fee_Percentage", "Attorneys_Fee_Percentage_Awarded_", "Fee_Lodestar", "Settling_Parties_Company_Individual_Auditor_Underwriter",
                "Settlement_Judge", "Mediator", "Defendant_Insurer", "Certified_Class_Representative1", "Certified_Class_Representative2",
                "Certified_Class_Representative3", "Certified_Class_Representative4", "Certified_Class_Representative5", "Defendant_Underwriter"};

            string[] ColumnNamesDate = new string[] { "First_Filed_Date", "Termination_Date", "First_Press_Release_Date", "LP_Appointment_Date", "Date_of_Order_on_1st_MTD",
                "Date_of_Order_on_2nd_MTD", "Date_of_Order_on_3rd_MTD", "Date_of_Class_Cert_Decision", "Stipulation_of_Settlement_Filed_Date", "Settlement_Hearing_Date",
                "Final_Settlement_Date", "Date_KTMC_paid"};
            
            for (int i = 0; i < ColumnNamesString.Length; i++)
            {
                DataColumn dc =  dt.Columns.Add(ColumnNamesString[i]);
                dc.DataType = typeof(String);
            }

            for (int i = 0; i < ColumnNamesDate.Length; i++)
            {
                DataColumn dc = dt.Columns.Add(ColumnNamesDate[i]);
                dc.DataType = typeof(DateTime);
            }

            dt.Rows.Add(txtDefendant_Company.Text.ToString(), txtStatus_of_Case.Text.ToString(), txtYear_Filed.Text.ToString()=="" ? 1900 :Convert.ToInt16(txtYear_Filed.Text.ToString()),
                txtLead_Case_Venue.Text.ToString(), cboType_of_Case.Text.ToString(), txtLead_Case_No.Text.ToString(), txtFirst_Jurisdiction_Filed.Text.ToString()+ " - " + txtFirst_Jurisdiction_No.Text.ToString(), txtKTMC_Marketing_PlanDesignation.Text.ToString(),
                txtSecond_Jurisdiction_Filed.Text.ToString()+ " - " + txtSecond_Jurisdiction_No.Text.ToString(), txtThird_Jurisdiction_Filed.Text.ToString()+ " - " + txtThird_Jurisdiction_No.Text.ToString(), txtFourth_Jurisdiction_Filed.Text.ToString() + " - " + txtFourth_Jurisdiction_No.Text.ToString(),
                txtLead_Plaintiff_Deadline.Text.ToString(), cboLead_Plaintiff_Movant1_Type.Text.ToString(), txtAppointed_Lead_Plaintiff.Text.ToString(),
                cboAppointed_Lead_Plaintiff_Type.Text.ToString(), cboLargest_Loss_Appointed.Text.ToString(), txtJudge_that_Appointed_LP.Text.ToString(), txtJudge_Assigned_to_Lead_Case.Text.ToString(),
                txtMagistrate_Judge.Text.ToString(), txtLead_Counsel_1.Text.ToString(), txtLead_Counsel_2.Text.ToString(), txtLead_Counsel_3.Text.ToString(), txtLead_Counsel_4.Text.ToString(), txtAppointed_Local_Liaison_Counsel.Text.ToString(), txtAppointed_Additional_Counsel.Text.ToString(),
                txtCorporate_Defense_Counsel_1.Text.ToString(), txtCorporate_Defense_Counsel_2.Text.ToString(), txtAttorney_for_Corporate_Defense_Counsel_2.Text.ToString(),
                txtCorporate_Defense_Counsel_3.Text.ToString(), txtAttorney_for_Corporate_Defense_Counsel_3.Text.ToString(), txtCorporate_Defense_Counsel_4.Text.ToString(), txtAttorney_for_Corporate_Defense_Counsel_4.Text.ToString(), txtKTMC_Internal_Case_No.Text.ToString(), txtInitial_Damage_Estimate_from_60day_list.Text.ToString(),
                txtLP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t.Text.ToString(), txtThe_1st_MTD_Result.Text.ToString(), txtThe_1st_MTD_Judge.Text.ToString(),
                txtThe_2nd_MTD_Result.Text.ToString(), txtThe_2nd_MTD_Judge.Text.ToString(), txtThe_3rd_MTD_Result.Text.ToString(), txtThe_3rd_MTD_Judge.Text.ToString(), txtClass_Cert_Result.Text.ToString(),
                txtClass_Cert_Judge.Text.ToString(), txtCertified_Class_Period.Text.ToString(), cboCertClassPeriodYN.Text.ToString(), cboSettlementType.Text.ToString(),
                cboSettlement_Stage_Examples.Text.ToString(), txtSettling_Lead_Plaintiffs.Text.ToString(), txtSettlement_Amount.Text.ToString(),
                txtSettlement_Attorneys_Fees.Text.ToString(), txtRequested_Attorneys__Fee_Percentage.Text.ToString(), txtAttorneys_Fee_Percentage_Awarded.Text.ToString(), txtFee_Lodestar.Text.ToString(), cboSettling_Parties.Text.ToString(),
                txtSettlement_Judge.Text.ToString(), txtMediator.Text.ToString(), txtDefendant_Insurer.Text.ToString(), txtCertified_Class_Representative1.Text.ToString(), txtCertified_Class_Representative2.Text.ToString(),
                txtCertified_Class_Representative3.Text.ToString(), txtCertified_Class_Representative4.Text.ToString(), txtCertified_Class_Representative5.Text.ToString(), txtDefendant_Underwriter.Text.ToString(),
                txtFirst_Filed_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtFirst_Filed_Date.Text.ToString()), 
                txtTermination_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtTermination_Date.Text.ToString()), 
                txtFirst_Press_Release_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtFirst_Press_Release_Date.Text.ToString()),
                txtLP_Appointment_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtLP_Appointment_Date.Text.ToString()), 
                txtDate_of_Order_on_1st_MTD.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtDate_of_Order_on_1st_MTD.Text.ToString()),
                txtDate_of_Order_on_2nd_MTD.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtDate_of_Order_on_2nd_MTD.Text.ToString()), 
                txtDate_of_Order_on_3rd_MTD.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtDate_of_Order_on_3rd_MTD.Text.ToString()), 
                txtDate_of_Class_Cert_Decision.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtDate_of_Class_Cert_Decision.Text.ToString()),
                txtStipulation_of_Settlement_Filed_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtStipulation_of_Settlement_Filed_Date.Text.ToString()), 
                txtSettlement_Hearing_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtSettlement_Hearing_Date.Text.ToString()),
                txtFinal_Settlement_Date.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtFinal_Settlement_Date.Text.ToString()), 
                txtDate_KTMC_paid.Text.ToString() == "" ? Convert.ToDateTime("#1900-01-01#") : Convert.ToDateTime(txtDate_KTMC_paid.Text.ToString()));
            
            db.RecNo = Convert.ToInt32(txtIDInfinity.Text.ToString());
            db.DataTableName = dt.TableName;
            db.DataTableObject = dt;
            bool SW = db.SaveDataTable();
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
            
        }

        protected void txtStatus_of_Case_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtYear_Filed_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtFirst_Filed_Date_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtTermination_Date_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtLead_Case_Venue_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtLead_Case_No_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtKTMC_Marketing_PlanDesignation_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtFirst_Jurisdiction_Filed_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtFirst_Jurisdiction_No_TextChanged(object sender, EventArgs e)
        {
            
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

        protected void txtThe_1st_MTD_Result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThe_2nd_MTD_Result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThe_3rd_MTD_Result_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThe_1st_MTD_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThe_2nd_MTD_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtThe_3rd_MTD_Judge_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cboSettlementType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtDefendant_Insurer_TextChanged(object sender, EventArgs e)
        {

        }
    }
}