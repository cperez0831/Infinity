<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DataEntry.aspx.cs" Inherits="Infinity.DataEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubMenuPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlMain" Visible="true" runat="server">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="Record No&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtIDInfinity" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Defendant&nbsp;Company&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDefendant_Company" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="&nbsp;Status&nbsp;of&nbsp;Case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStatus_of_Case" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="&nbsp;Year&nbsp;Filed&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtYear_Filed" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="First&nbsp;Filed&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Filed_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="&nbsp;Termination&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtTermination_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="&nbsp;Lead&nbsp;Case&nbsp;Venue&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Case_Venue" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label8" runat="server" Text="Type&nbsp;of&nbsp;Case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboType_of_Case" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboType_of_Case_SelectedIndexChanged3">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>10b</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>14e</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label9" runat="server" Text="&nbsp;Lead&nbsp;Case&nbsp;No.&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Case_No" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label18" runat="server" Text="&nbsp;KTMC&nbsp;Marketing&nbsp;Plan&nbsp;Designation&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtKTMC_Marketing_PlanDesignation" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label10" runat="server" Text="First&nbsp;Jurisdiction&nbsp;Filed&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Jurisdiction_Filed" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label11" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Jurisdiction_No" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label12" runat="server" Text="&nbspSecond&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSecond_Jurisdiction_Filed" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label13" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSecond_Jurisdiction_No" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label14" runat="server" Text="Third&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThird_Jurisdiction_Filed" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label15" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThird_Jurisdiction_No" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label16" runat="server" Text="&nbspFourth&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFourth_Jurisdiction_Filed" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label17" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFourth_Jurisdiction_No" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label19" runat="server" Text="First&nbsp;Press&nbsp;Release&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Press_Release_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label20" runat="server" Text="&nbsp;Lead&nbsp;Plaintiff&nbsp;Deadline&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Plaintiff_Deadline" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label21" runat="server" Text="&nbsp;Lead&nbsp;Plaintiff&nbsp;Movant&nbsp;1&nbsp;Type&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboLead_Plaintiff_Movant1_Type" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboLead_Plaintiff_Movant1_Type_SelectedIndexChanged3">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Institutional</asp:ListItem>
                        <asp:ListItem>Individual</asp:ListItem>
                        <asp:ListItem>Mixed</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label22" runat="server" Text="LP&nbsp;Appointment&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLP_Appointment_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label23" runat="server" Text="&nbsp;Appointed&nbsp;Lead&nbsp;Plaintiff&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Lead_Plaintiff" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label24" runat="server" Text="&nbsp;Appointed&nbsp;Lead&nbsp;Plaintiff&nbsp;Type&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboAppointed_Lead_Plaintiff_Type" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboAppointed_Lead_Plaintiff_Type_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Individual</asp:ListItem>
                        <asp:ListItem>Institution</asp:ListItem>
                        <asp:ListItem>Group Of</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label25" runat="server" Text="&nbsp;Largest&nbsp;Loss&nbsp;Appointed&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboLargest_Loss_Appointed" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboLargest_Loss_Appointed_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label26" runat="server" Text="Judge&nbsp;that&nbsp;appointed&nbsp;LP&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtJudge_that_Appointed_LP" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label27" runat="server" Text="&nbsp;Judge&nbsp;assigned&nbsp;to&nbsp;lead&nbsp;case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtJudge_Assigned_to_Lead_Case" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label28" runat="server" Text="&nbsp;Magistrate Judge&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMagistrate_Judge" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label29" runat="server" Text="Lead&nbsp;Counsel&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label30" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_2" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label31" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_3" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label32" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_4" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label33" runat="server" Text="Appointed&nbsp;Local&nbsp;Liason&nbsp;Counsel&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Local_Liaison_Counsel" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label34" runat="server" Text="&nbsp;Appointed&nbsp;Additional&nbsp;Counsel&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Additional_Counsel" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label35" runat="server" Text="Corporate&nbsp;Defense&nbsp;Counsel&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label36" runat="server" Text="&nbsp;Attorney&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label37" runat="server" Text="&nbsp;Corporate&nbsp;Defense&nbsp;Counsel&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_2" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label38" runat="server" Text="&nbsp;Attorney&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_2" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label39" runat="server" Text="Corporate&nbsp;Defense&nbsp;Counsel&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_3" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label40" runat="server" Text="&nbsp;Attorney&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_3" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label41" runat="server" Text="&nbsp;Corporate&nbsp;Defense&nbsp;Counsel&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_4" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label42" runat="server" Text="&nbsp;Attorney&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_4" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table2" runat="server">
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                <asp:Label runat="server" Text="KTMC&nbsp;Internal&nbsp;Case&nbsp;No.&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtKTMC_Internal_Case_No" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:Label runat="server" Text="&nbsp;Initial&nbsp;Damage&nbsp;Estimate&nbsp;for&nbsp;60&nbsp;day&nbsp;list&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInitial_Damage_Estimate_from_60day_list" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:Label runat="server" Text="&nbsp;LP&nbsp;of&nbsp;Estimated&nbsp;Class&nbsp;Loss&nbsp;from&nbsp;landscape&nbsp;divided&nbsp;by&nbsp;t&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table3" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label43" runat="server" Text="Date&nbsp;of&nbsp;Order&nbsp;on&nbsp;1st&nbsp;MTD&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Order_on_1st_MTD" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label44" runat="server" Text="&nbsp;Date&nbsp;of&nbsp;Order&nbsp;on&nbsp;2nd&nbsp;MTD&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Order_on_2nd_MTD" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label45" runat="server" Text="&nbsp;Date&nbsp;of&nbsp;Order&nbsp;on&nbsp;3rd&nbsp;MTD&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Order_on_3rd_MTD" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label46" runat="server" Text="Date&nbsp;of&nbsp;Class&nbsp;Cert&nbsp;Decision&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Class_Cert_Decision" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label47" runat="server" Text="&nbsp;Class&nbsp;Cert&nbsp;Result&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtClass_Cert_Result" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label48" runat="server" Text="&nbsp;Class&nbsp;Cert&nbsp;Judge&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtClass_Cert_Judge" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label49" runat="server" Text="Certified&nbsp;Class&nbsp;Period&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Period" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label50" runat="server" Text="&nbsp;Is&nbsp;Certified&nbsp;Class&nbsp;Period&nbsp;Sames&nbsp;As&nbsp;Original&nbsp;Class&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboCertClassPeriodYN" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboCertClassPeriodYN_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label51" runat="server" Text="&nbsp;Stipulation&nbsp;of&nbsp;Settlement&nbsp;Filed&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStipulation_of_Settlement_Filed_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label52" runat="server" Text="&nbsp;Settlement&nbsp;Type&nbsp;"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="cboStipulationType" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboStipulationType_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Stock</asp:ListItem>
                        <asp:ListItem>Mixed</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label53" runat="server" Text="Settlement&nbspStage&nbspExamples&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboSettlement_Stage_Examples" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboSettlement_Stage_Examples_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Motion To Dismiss</asp:ListItem>
                        <asp:ListItem>Summary Judgment</asp:ListItem>
                        <asp:ListItem>cla</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label54" runat="server" Text="&nbsp;Settlement&nbsp;hearing&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Hearing_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label55" runat="server" Text="&nbsp;Setting&nbsp;Lead&nbsp;Plaintiffs&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettling_Lead_Plaintiffs" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label56" runat="server" Text="Final&nbsp;Settlement&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFinal_Settlement_Date" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label57" runat="server" Text="&nbsp;Settlement&nbsp;Amount&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Amount" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label58" runat="server" Text="&nbspSettlement&nbsp;Attorneys&nbsp;Fees&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Attorneys_Fees" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label59" runat="server" Text="Requested&nbsp;Attorneys&nbsp;Fee&nbsp;Percentage&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtRequested_Attorneys__Fee_Percentage" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label60" runat="server" Text="&nbsp;Attorneys&nbsp;Fee&nbsp;Percentage&nbsp;Awarded&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorneys_Fee_Percentage_Awarded" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label61" runat="server" Text="&nbspFee&nbsp;Lodestar&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFee_Lodestar" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table4" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label62" runat="server" Text="Settlement&nbsp;Parties&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboSettling_Parties" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboSettling_Parties_SelectedIndexChanged">
                        <asp:ListItem Selected="True">&nbsp;</asp:ListItem>
                        <asp:ListItem>Company</asp:ListItem>
                        <asp:ListItem>Individual</asp:ListItem>
                        <asp:ListItem>Auditor</asp:ListItem>
                        <asp:ListItem>Underwriter</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label63" runat="server" Text="&nbsp;Settlement&nbsp;Judge&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Judge" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label64" runat="server" Text="&nbsp;Mediator&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMediator" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label65" runat="server" Text="&nbsp;Defendant&nbsp;Insurer&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Defendant_Insurer" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table5" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label66" runat="server" Text="Certified&nbsp;Class&nbsp;Rep&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative1" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label67" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative2" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label68" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative3" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label69" runat="server" Text="Certified&nbsp;Class&nbsp;Rep&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative4" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label70" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;5&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative5" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label71" runat="server" Text="Date&nbsp;KTMC&nbsp;Paid&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_KTMC_paid" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label72" runat="server" Text="&nbsp;Defendant&nbsp;Underwriter&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDefendant_Underwriter" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>

</asp:Content>
