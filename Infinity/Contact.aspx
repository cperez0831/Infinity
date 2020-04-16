<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="Contact.aspx.cs" Inherits="Infinity.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        280 King of Prussia Rd<br />
        Radnor, PA 19087<br />
        <abbr title="Phone">P:</abbr>
        610.667.7706
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:it@ktmc.com">it@ktmc.com</a><br />
    </address>
</asp:Content>
