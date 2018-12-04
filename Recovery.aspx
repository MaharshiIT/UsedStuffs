<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Recovery.aspx.cs" Inherits="Recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function chk() {
        var e = document.getElementById("ContentPlaceHolder1_txtEm").value;
        if (e == "") {
            document.getElementById("ContentPlaceHolder1_lblMsg").innerHTML = "Please fill in data";
            document.getElementById("ContentPlaceHolder1_txtEm").focus();
            return false;
        }
        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "Recovery", false, false));
    }
</script>
<div style="height:85px">
<form runat="server">
<table border="0">
<tr>
<td></td>
<td><asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
</tr>
<tr>
<td style="font-weight:bold">Please enter your registered EMail ID : </td>
<td><asp:TextBox ID="txtEm" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td></td>
<td><asp:Button ID="btnSubmit" runat="server" Text="Submit" PostBackUrl="~/Recovery" OnClick="submit_click" OnClientClick="return chk();" /></td>
</tr>
</table>
</form>
</div>

</asp:Content>

