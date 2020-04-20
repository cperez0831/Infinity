<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Login.aspx.cs" Inherits="Infinity.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
    <link rel="Stylesheet" href="css/Stylesheet.css" />
</head>
<body>
    <script type="text/javascript">
        function UserNotFound(usr) {
            alert(usr + 'not found' + '\n' + 'Please consult your administrator.');
        }
    </script>
    <form id="form1" runat="server">
    <div>
       <table cellspacing="1" cellpadding="2" align="left" bgcolor="white">
        	<tr valign="bottom"><td><asp:Image ID="logoImage" runat="server" ImageUrl="~/Images/logo.png" Height="79" AlternateText="KesslerTopazMeltzerCheck LLP" /></td>
        	<td width="20"></td>
        	<td style="font-family: Tahoma; color:#3E5264; text-align:right; font-weight:bold; font-size:14px; background-color: #F9FFFF;">Infinity Application<br />&nbsp;</td>
        	</tr> 
        	<tr>
        	<tr height="20"><td></td></tr>
        	<td colspan=3 align="center">
        	      <table class="shadedTable" align="center" cellpadding="2" cellspacing="2"><caption align="center">Login</caption>
                    <tr><td style="width:100px;"><asp:Label ID="UserNameLabel" runat="server" Text="User Name:" AssociatedControlID="UserNameTextBox"></asp:Label></td><td style="width:100px;"><asp:TextBox ID="UserNameTextBox" runat="server" BackColor="Transparent" AutoCompleteType="Disabled" OnTextChanged="UserNameTextBox_TextChanged"></asp:TextBox></td></tr>
                    <tr><td style="width:100px;"><asp:Label ID="PasswordLabel" runat="server" Text="Password:" AssociatedControlID="PasswordTextBox"></asp:Label></td><td style="width:100px;"><asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" AutoCompleteType="Disabled" OnTextChanged="PasswordTextBox_TextChanged"></asp:TextBox></td></tr>
                    <tr><td colspan="2"></td></tr>
                    <tr><td colspan="2" align="center"><asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="inputButton" OnClick="LoginButton_Click" /></td></tr>
                    <tr><td colspan="2" align="center"><asp:Label ID="InvalidLoginLabel" runat="server" Text="Invalid Login." ForeColor="Red" Visible="false"></asp:Label></td></tr>
                  </table> 

        	</td>
        	</tr>       
           <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" >
           
           </asp:ObjectDataSource>
          </table>    
    </div>
    </form>
</body>
</html>
