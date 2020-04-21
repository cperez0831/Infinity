<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="Infinity.UserControls.Menu" %>
<script language="javascript" type="text/javascript">
    function selectItem(lnkItem)
    {
       lnkItem.style.backgroundColor="#9eae5a";
    }
    
    function deSelectItem(lnkItem)
    {
       lnkItem.style.backgroundColor="#3e5264";
    }
    function myPopup(myURL, title, myWidth, myHeight) {
        var left = (screen.width - myWidth) / 2;
        var top = (screen.height - myHeight) / 4;
        var myWindow = window.open(myURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + myWidth + ', height=' + myHeight + ', top=' + top + ', left=' + left);
    }
</script>

 	<table width="840px" cellspacing="1" cellpadding="2" align="center" bgcolor="white">
        	<tr valign="bottom"><td style="width:420px;"><asp:Image ID="logoImage" runat="server" ImageUrl="~/Images/logo.png" Height="79" AlternateText="KesslerTopazMeltzerCheck LLP" /></td>
        	<td style="width:420px; font-family: Tahoma; color:#3E5264; text-align:right; font-weight:bold; font-size:16px; background-color: #F9FFFF;">Infinity Application<br />&nbsp;</td>
        	</tr>
        	</table>
<!--
        	<table width="840px" cellspacing="1" cellpadding="2" align="center" >

			<tr style="VERTICAL-ALIGN: middle; height:22px;">
				<td  id="tdFileMaintenance" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; height:24px; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="FileMaintenanceHyperLink" CssClass="menu" runat="server" NavigateUrl="~/Main.aspx" ForeColor="White" Text="File Maintenance" Width="100%" ></asp:HyperLink></td>
				<!--
                <td id="tdReports" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="ReportsHyperLink"  runat="server" CssClass="menu" NavigateUrl="~/Report/QueryPage.aspx" ForeColor="White" Text="Reports" Width="100%"></asp:HyperLink></td>
                
                <!--<td id="tdNewReports" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="NewReportsHyperLink"  runat="server" CssClass="menu" NavigateUrl="~/Report/StatementReport.aspx" ForeColor="White" Text="New Reports" Width="100%"></asp:HyperLink></td>-->
                <!--    				
                <td id="tdEMailBatch" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="EmailBatchHyperLinl"  runat="server" CssClass="menu" NavigateUrl="~/NotesBulkUpdate.aspx" ForeColor="White" Text="Import/Export" Width="100%"></asp:HyperLink></td>

                <td id="tdCampaign" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="CampaignHyperLink"  runat="server" CssClass="menu" NavigateUrl="~/Campaign.aspx" ForeColor="White" Text="Campaign / Cases" Width="100%"></asp:HyperLink></td>
				-->
<!--
				<td id="tdContact" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="ContactHyperLink"  runat="server" CssClass="menu" NavigateUrl="~/Contact.aspx" ForeColor="White" Text="Contact" Width="100%"></asp:HyperLink></td>
				<td id="tdAbout" runat="server" style="FONT-WEIGHT:bold; FONT-SIZE:9pt; WIDTH:140px; COLOR:white; FONT-FAMILY:'Microsoft Sans Serif'; TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="AboutHyperLink"  runat="server" CssClass="menu" NavigateUrl="~/About.aspx" ForeColor="White" Text="About" Width="100%"></asp:HyperLink></td>
				<td id="tdAdmin" runat="server" style="FONT-WEIGHT:bold;FONT-SIZE:9pt;WIDTH:140px;COLOR:white;FONT-FAMILY:'Microsoft Sans Serif';TEXT-ALIGN:center; vertical-align: middle; background-color:#3e5264;"
					><asp:HyperLink ID="AdminHyperLink" runat="server" CssClass="menu" ForeColor="White" NavigateUrl="~/Admin/Brokerage.aspx" Text="Admin" Width="100%" ></asp:HyperLink></td>
			</tr>
    
            <tr><td>&nbsp;</td></tr>
		</table>
-->