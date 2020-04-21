<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Main.aspx.cs" Inherits="Infinity.Main" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubMenuPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* bootstrap.css (1084, 7) */
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.75;
            color: #333;
            background-color: #fff;
        }

        .grid_scroll {
            overflow: auto;
            height: 700px;
            border: solid 1px orange;
            height: 680px;
            width: 1200px;
        }
    </style>
    <script type="text/javascript">
        var oldgridSelectedColor;

        function setMouseOverColor(element) {
            oldgridSelectedColor = element.style.backgroundColor;
            element.style.backgroundColor = 'skyblue';
            element.style.cursor = 'hand';
            element.style.textDecoration = 'underline';
        }

        function setMouseOutColor(element) {
            element.style.backgroundColor = oldgridSelectedColor;
            element.style.textDecoration = 'none';
        }

        function DispMessage(msg) {
            var alert_value = document.createElement("INPUT");
            alert_value.type = "hidden";
            alert_value.name = "alert_value";
            alert_value.value = "";
            alert(msg);
            alert_value.value = "Clicked";
            document.forms[0].appendChild(alert_value);
        }

        function DeletedRec(msg) {
            DispMessage(msg);
            __doPostBack('DeletedRec', 'Clicked');
        }

        function Confirm() {
          var confirm_value = document.createElement("INPUT");
          confirm_value.type = "hidden";
          confirm_value.name = "confirm_value";
          if (confirm("Are you sure you want to delete this record?")) {
              confirm_value.value = "Yes";
          } else {
              confirm_value.value = "No";
          }
          document.forms[0].appendChild(confirm_value);
        }

        function checkRadioBtn(id) {
            var gv = document.getElementById('<%=gv.ClientID %>');
            var hd = document.getElementById('<%=hdnRecNo.ClientID %>');
            var recno = "";

            for (var i = 1; i < gv.rows.length; i++) {
                var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");

                // Check if the id not same
                try {
                    if (radioBtn[0].id != id.id) {
                        radioBtn[0].checked = false;
                    } else {
                        recno = gv.rows[i].cells[2].innerText.toString();
                        hd.value = recno;
                    }
                } catch (e) { }
            }
            return recno;
        }

        
    </script>
    <asp:HiddenField ID="hdnRecNo" runat="server" Value="Temp" />
    <asp:HiddenField ID="hdnVerified" runat="server" Value="false" />
    <asp:Panel ID="pnlButtons01" runat="server" Visible="true">
        <asp:Button ID="btnAdd01" type="button" runat="server" Text="Add/Create" OnClick="ButtonAdd" Visible="true" />&nbsp;
        <asp:Button ID="btnDelete01" runat="server" Text="Delete" OnClientClick="Confirm()" OnClick="ButtonDelete" Visible="false" />&nbsp;
        <asp:Button ID="btnSave01" runat="server" Text="Save" OnClick="ButtonSave" Visible="false" />&nbsp;
        <asp:Button ID="btnVerify01" runat="server" Text="Verify" OnClick="ButtonVerify" Visible="false" />&nbsp;
        <asp:Button ID="btnCancel01" runat="server" Text="Cancel" OnClick="ButtonCancel" Visible="false" />&nbsp;
        <br />
        &nbsp;<br />
    </asp:Panel>
    <asp:Panel ID="pnlData" runat="server" Visible ="true">
        <div id="GridScroll" class="grid_scroll">
            <asp:GridView ID="gv" runat="server" CellPadding="4" ForeColor="#333333"
                DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                SortedAscendingHeaderStyle-Wrap="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <RowStyle Height="0.5in" />
                <Columns>
                    <asp:BoundField DataField="IDInfinity" ReadOnly="true" HeaderText="Record No">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CheckBoxField HeaderText="Verified" DataField="Verified" ReadOnly="true"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="Defendant_Company" HeaderText="Defendant Company"></asp:BoundField>
                    <asp:BoundField DataField="Lead_Case_Venue" HeaderText="Lead Case Venue" />
                    <asp:BoundField DataField="Judge_Assigned_to_Lead_Case" HeaderText="Judge Assigned to Lead Case" />
                    <asp:BoundField DataField="Magistrate_Judge" HeaderText="Magistrate Judge" />
                    <asp:BoundField DataField="Lead_Counsel_1_" HeaderText="Lead Counsel 1" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:InfinityDevConnectionString %>"
                DeleteCommand="DELETE FROM [Infinity_LPLB] WHERE [IDInfinity] = @IDInfinity"
                InsertCommand="INSERT INTO [Infinity_LPLB] ([Defendant_Company], [Lead_Case_Venue], [Judge_Assigned_to_Lead_Case], [Magistrate_Judge], [Lead_Counsel_1_]) VALUES (@Defendant_Company, @Lead_Case_Venue, @Judge_Assigned_to_Lead_Case, @Magistrate_Judge, @Lead_Counsel_1_)"
                SelectCommand="SELECT [Verified], [IDInfinity], [Defendant_Company], [Lead_Case_Venue], [Judge_Assigned_to_Lead_Case], [Magistrate_Judge], [Lead_Counsel_1_] FROM [Infinity_LPLB] WHERE [DeletedRecord] = 0 ORDER BY [Defendant_Company]"
                UpdateCommand="UPDATE [Infinity_LPLB] SET [Defendant_Company] = @Defendant_Company, [Lead_Case_Venue] = @Lead_Case_Venue, [Judge_Assigned_to_Lead_Case] = @Judge_Assigned_to_Lead_Case, [Magistrate_Judge] = @Magistrate_Judge, [Lead_Counsel_1_] = @Lead_Counsel_1_ WHERE [IDInfinity] = @IDInfinity"></asp:SqlDataSource>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlMain" visible="false" runat="server">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>&nbsp;</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell>
                    <asp:Label ID="lblRecNo" runat="server" Text="Record No&nbsp;" ForeColor="Black"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtIDInfinity" runat="server" ReadOnly="true" ForeColor="Black"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="chkVerified" runat="server" Text="Verified&nbsp;&nbsp;" Enabled="false" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblVerifiedBy" runat="server" Text="Verified by no one" Style="visibility:hidden"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ID="tdInvalidEnteries" ForeColor="Red" BorderColor="Red" Style="visibility:hidden">
                    <asp:Label ID="lblInvalidEntries" runat="server" Text="&nbsp;Invalid&nbsp;Entries&nbsp;" BorderColor="red" BorderStyle="Solid" BorderWidth="2px" Visible="false"></asp:Label>
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
                    <asp:TextBox ID="txtDefendant_Company" runat="server" OnTextChanged="txtDefendant_Company_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label3" runat="server" Text="&nbsp;Status&nbsp;of&nbsp;Case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtStatus_of_Case" runat="server" OnTextChanged="txtStatus_of_Case_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label4" runat="server" Text="&nbsp;Year&nbsp;Filed&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtYear_Filed" runat="server" OnTextChanged="txtYear_Filed_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Width="100%">
                <asp:TableCell>
                    <asp:Label ID="Label5" runat="server" Text="First&nbsp;Filed&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Filed_Date" runat="server" OnTextChanged="txtFirst_Filed_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label6" runat="server" Text="&nbsp;Termination&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtTermination_Date" runat="server" OnTextChanged="txtTermination_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label7" runat="server" Text="&nbsp;Lead&nbsp;Case&nbsp;Venue&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Case_Venue" runat="server" OnTextChanged="txtLead_Case_Venue_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label8" runat="server" Text="Type&nbsp;of&nbsp;Case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboType_of_Case" runat="server" AutoPostBack="true" AppendDataBoundItems="true" 
                        OnSelectedIndexChanged="cboType_of_Case_SelectedIndexChanged">
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
                    <asp:TextBox ID="txtLead_Case_No" runat="server" OnTextChanged="txtLead_Case_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label18" runat="server" Text="&nbsp;KTMC&nbsp;Marketing&nbsp;Plan&nbsp;Designation&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtKTMC_Marketing_PlanDesignation" runat="server" OnTextChanged="txtKTMC_Marketing_PlanDesignation_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label10" runat="server" Text="First&nbsp;Jurisdiction&nbsp;Filed&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Jurisdiction_Filed" runat="server" OnTextChanged="txtFirst_Jurisdiction_Filed_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label11" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Jurisdiction_No" runat="server" OnTextChanged="txtFirst_Jurisdiction_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label12" runat="server" Text="&nbspSecond&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSecond_Jurisdiction_Filed" runat="server" OnTextChanged="txtSecond_Jurisdiction_Filed_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label13" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSecond_Jurisdiction_No" runat="server" OnTextChanged="txtSecond_Jurisdiction_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label14" runat="server" Text="Third&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThird_Jurisdiction_Filed" runat="server" OnTextChanged="txtThird_Jurisdiction_Filed_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label15" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThird_Jurisdiction_No" runat="server" OnTextChanged="txtThird_Jurisdiction_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label16" runat="server" Text="&nbspFourth&nbsp;Jurisdiction&nbsp;Filed&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFourth_Jurisdiction_Filed" runat="server" OnTextChanged="txtFourth_Jurisdiction_Filed_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label17" runat="server" Text="&nbspNo.&nbsp"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFourth_Jurisdiction_No" runat="server" OnTextChanged="txtFourth_Jurisdiction_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label19" runat="server" Text="First&nbsp;Press&nbsp;Release&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFirst_Press_Release_Date" runat="server" OnTextChanged="txtFirst_Press_Release_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label20" runat="server" Text="&nbsp;Lead&nbsp;Plaintiff&nbsp;Deadline&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Plaintiff_Deadline" runat="server" OnTextChanged="txtLead_Plaintiff_Deadline_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label21" runat="server" Text="&nbsp;Lead&nbsp;Plaintiff&nbsp;Movant&nbsp;1&nbsp;Type&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="cboLead_Plaintiff_Movant1_Type" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboLead_Plaintiff_Movant1_Type_SelectedIndexChanged">
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
                    <asp:TextBox ID="txtLP_Appointment_Date" runat="server" OnTextChanged="txtLP_Appointment_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label23" runat="server" Text="&nbsp;Appointed&nbsp;Lead&nbsp;Plaintiff&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Lead_Plaintiff" runat="server" OnTextChanged="txtAppointed_Lead_Plaintiff_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="txtJudge_that_Appointed_LP" runat="server" OnTextChanged="txtJudge_that_Appointed_LP_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label27" runat="server" Text="&nbsp;Judge&nbsp;assigned&nbsp;to&nbsp;lead&nbsp;case&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtJudge_Assigned_to_Lead_Case" runat="server" OnTextChanged="txtJudge_Assigned_to_Lead_Case_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label28" runat="server" Text="&nbsp;Magistrate Judge&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMagistrate_Judge" runat="server" OnTextChanged="txtMagistrate_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label29" runat="server" Text="Lead&nbsp;Counsel&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_1" runat="server" OnTextChanged="txtLead_Counsel_1_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label30" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_2" runat="server" OnTextChanged="txtLead_Counsel_2_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label31" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_3" runat="server" OnTextChanged="txtLead_Counsel_3_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label32" runat="server" Text="&nbsp;Lead&nbsp;Counsel&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLead_Counsel_4" runat="server" OnTextChanged="txtLead_Counsel_4_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label33" runat="server" Text="Appointed&nbsp;Local&nbsp;Liason&nbsp;Counsel&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Local_Liaison_Counsel" runat="server" OnTextChanged="txtAppointed_Local_Liaison_Counsel_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label34" runat="server" Text="&nbsp;Appointed&nbsp;Additional&nbsp;Counsel&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppointed_Additional_Counsel" runat="server" OnTextChanged="txtAppointed_Additional_Counsel_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label35" runat="server" Text="Corporate&nbsp;Defense&nbsp;Counsel&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_1" runat="server" OnTextChanged="txtCorporate_Defense_Counsel_1_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label36" runat="server" Text="&nbsp;Attorney&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_1" runat="server" OnTextChanged="txtAttorney_for_Corporate_Defense_Counsel_1_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label37" runat="server" Text="&nbsp;Corporate&nbsp;Defense&nbsp;Counsel&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_2" runat="server" OnTextChanged="txtCorporate_Defense_Counsel_2_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label38" runat="server" Text="&nbsp;Attorney&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_2" runat="server" OnTextChanged="txtAttorney_for_Corporate_Defense_Counsel_2_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label39" runat="server" Text="Corporate&nbsp;Defense&nbsp;Counsel&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_3" runat="server" OnTextChanged="txtCorporate_Defense_Counsel_3_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label40" runat="server" Text="&nbsp;Attorney&nbsp;3&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_3" runat="server" OnTextChanged="txtAttorney_for_Corporate_Defense_Counsel_3_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label41" runat="server" Text="&nbsp;Corporate&nbsp;Defense&nbsp;Counsel&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCorporate_Defense_Counsel_4" runat="server" OnTextChanged="txtCorporate_Defense_Counsel_4_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label42" runat="server" Text="&nbsp;Attorney&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorney_for_Corporate_Defense_Counsel_4" runat="server" OnTextChanged="txtAttorney_for_Corporate_Defense_Counsel_4_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="txtKTMC_Internal_Case_No" runat="server" OnTextChanged="txtKTMC_Internal_Case_No_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:Label runat="server" Text="&nbsp;Initial&nbsp;Damage&nbsp;Estimate&nbsp;for&nbsp;60&nbsp;day&nbsp;list&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtInitial_Damage_Estimate_from_60day_list" runat="server" OnTextChanged="txtInitial_Damage_Estimate_from_60day_list_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:Label runat="server" Text="&nbsp;LP&nbsp;of&nbsp;Estimated&nbsp;Class&nbsp;Loss&nbsp;from&nbsp;landscape&nbsp;divided&nbsp;by&nbsp;t&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t" runat="server" OnTextChanged="txtLP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="txtDate_of_Order_on_1st_MTD" runat="server" OnTextChanged="txtDate_of_Order_on_1st_MTD_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label44" runat="server" Text="&nbsp;Date&nbsp;of&nbsp;Order&nbsp;on&nbsp;2nd&nbsp;MTD&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Order_on_2nd_MTD" runat="server" OnTextChanged="txtDate_of_Order_on_2nd_MTD_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label45" runat="server" Text="&nbsp;Date&nbsp;of&nbsp;Order&nbsp;on&nbsp;3rd&nbsp;MTD&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Order_on_3rd_MTD" runat="server" OnTextChanged="txtDate_of_Order_on_3rd_MTD_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="The&nbsp;1st&nbsp;MTD&nbsp;Result"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_1st_MTD_Result" runat="server" OnTextChanged="txtThe_1st_MTD_Result_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label73" runat="server" Text="&nbsp;The&nbsp;2nd&nbsp;MTD&nbsp;Result"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_2nd_MTD_Result" runat="server" OnTextChanged="txtThe_2nd_MTD_Result_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label74" runat="server" Text="&nbsp;The&nbsp;3rd&nbsp;MTD&nbsp;Result"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_3rd_MTD_Result" runat="server" OnTextChanged="txtThe_3rd_MTD_Result_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label75" runat="server" Text="The&nbsp;1st&nbsp;MTD&nbsp;Judge"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_1st_MTD_Judge" runat="server" OnTextChanged="txtThe_1st_MTD_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label76" runat="server" Text="&nbsp;The&nbsp;2nd&nbsp;MTD&nbsp;Judge"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_2nd_MTD_Judge" runat="server" OnTextChanged="txtThe_2nd_MTD_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label77" runat="server" Text="&nbsp;The&nbsp;3rd&nbsp;MTD&nbsp;Judge"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtThe_3rd_MTD_Judge" runat="server" OnTextChanged="txtThe_3rd_MTD_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label46" runat="server" Text="Date&nbsp;of&nbsp;Class&nbsp;Cert&nbsp;Decision&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_of_Class_Cert_Decision" runat="server" OnTextChanged="txtDate_of_Class_Cert_Decision_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label47" runat="server" Text="&nbsp;Class&nbsp;Cert&nbsp;Result&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtClass_Cert_Result" runat="server" OnTextChanged="txtClass_Cert_Result_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label48" runat="server" Text="&nbsp;Class&nbsp;Cert&nbsp;Judge&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtClass_Cert_Judge" runat="server" OnTextChanged="txtClass_Cert_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label49" runat="server" Text="Certified&nbsp;Class&nbsp;Period&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Period" runat="server" OnTextChanged="txtCertified_Class_Period_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="txtStipulation_of_Settlement_Filed_Date" runat="server" OnTextChanged="txtStipulation_of_Settlement_Filed_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label52" runat="server" Text="&nbsp;Settlement&nbsp;Type&nbsp;"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:DropDownList ID="cboSettlementType" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="cboSettlementType_SelectedIndexChanged">
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
                    <asp:TextBox ID="txtSettlement_Hearing_Date" runat="server" OnTextChanged="txtSettlement_Hearing_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label55" runat="server" Text="&nbsp;Setting&nbsp;Lead&nbsp;Plaintiffs&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettling_Lead_Plaintiffs" runat="server" OnTextChanged="txtSettling_Lead_Plaintiffs_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label56" runat="server" Text="Final&nbsp;Settlement&nbsp;Date&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFinal_Settlement_Date" runat="server" OnTextChanged="txtFinal_Settlement_Date_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label57" runat="server" Text="&nbsp;Settlement&nbsp;Amount&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Amount" runat="server" OnTextChanged="txtSettlement_Amount_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label58" runat="server" Text="&nbspSettlement&nbsp;Attorneys&nbsp;Fees&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSettlement_Attorneys_Fees" runat="server" OnTextChanged="txtSettlement_Attorneys_Fees_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label59" runat="server" Text="Requested&nbsp;Attorneys&nbsp;Fee&nbsp;Percentage&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtRequested_Attorneys__Fee_Percentage" runat="server" OnTextChanged="txtRequested_Attorneys__Fee_Percentage_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label60" runat="server" Text="&nbsp;Attorneys&nbsp;Fee&nbsp;Percentage&nbsp;Awarded&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAttorneys_Fee_Percentage_Awarded" runat="server" OnTextChanged="txtAttorneys_Fee_Percentage_Awarded_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label61" runat="server" Text="&nbspFee&nbsp;Lodestar&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFee_Lodestar" runat="server" OnTextChanged="txtFee_Lodestar_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="txtSettlement_Judge" runat="server" OnTextChanged="txtSettlement_Judge_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label64" runat="server" Text="&nbsp;Mediator&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMediator" runat="server" OnTextChanged="txtMediator_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label65" runat="server" Text="&nbsp;Defendant&nbsp;Insurer&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDefendant_Insurer" runat="server" OnTextChanged="txtDefendant_Insurer_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="Table5" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label66" runat="server" Text="Certified&nbsp;Class&nbsp;Rep&nbsp;1&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative1" runat="server" OnTextChanged="txtCertified_Class_Representative1_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label67" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;2&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative2" runat="server" OnTextChanged="txtCertified_Class_Representative2_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label68" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative3" runat="server" OnTextChanged="txtCertified_Class_Representative3_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label69" runat="server" Text="Certified&nbsp;Class&nbsp;Rep&nbsp;4&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative4" runat="server" OnTextChanged="txtCertified_Class_Representative4_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label70" runat="server" Text="&nbsp;Certified&nbsp;Class&nbsp;Rep&nbsp;5&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCertified_Class_Representative5" runat="server" OnTextChanged="txtCertified_Class_Representative5_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label71" runat="server" Text="Date&nbsp;KTMC&nbsp;Paid&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDate_KTMC_paid" runat="server" OnTextChanged="txtDate_KTMC_paid_TextChanged"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="Label72" runat="server" Text="&nbsp;Defendant&nbsp;Underwriter&nbsp;"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDefendant_Underwriter" runat="server" OnTextChanged="txtDefendant_Underwriter_TextChanged"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <asp:Panel ID="pnlButtons02" runat="server" visible="true">
        <br />
        <asp:Button ID="btnAdd02" type="button" runat="server" Text="Add/Create" OnClick="ButtonAdd" Visible="true" />&nbsp;
        <asp:Button ID="btnDelete02" runat="server" Text="Delete"  OnClientClick="Confirm()" OnClick="ButtonDelete" Visible="false" />&nbsp;
        <asp:Button ID="btnSave02" runat="server" Text="Save" OnClick="ButtonSave" Visible="false" />&nbsp;
        <asp:Button ID="btnVerify02" runat="server" Text="Verify" OnClick="ButtonVerify" Visible="false" />&nbsp;
        <asp:Button ID="btnCancel02" runat="server" Text="Cancel" OnClick="ButtonCancel" Visible="false" />&nbsp;
    </asp:Panel>
</asp:Content>
