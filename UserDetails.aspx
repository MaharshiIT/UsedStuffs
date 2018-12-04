<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
function validate() {
            var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
            var em = document.getElementById("ContentPlaceHolder1_txtEm").value;
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (fn.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter name";
                document.getElementById("ContentPlaceHolder1_txtFN").focus();
                return false;
            }
            if (em.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter Email ID";
                document.getElementById("ContentPlaceHolder1_txtEm").focus();
                return false;
            }
            if (em != "") {
                if (!em.match(mailformat)) {
                    document.getElementById("val").innerHTML = "Invalid Email ID! Please try again";
                    document.getElementById("ContentPlaceHolder1_txtEm").focus();
                    return false;
                }
            }
            }
</script>
<form runat="server">
<div style="height:200px; width:500px; background-color:Orange; margin-left:25%">
<div align="center" style="font-size:large; font-weight:bold">User Details</div>
<div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
<table border="0">
<tr>
<td>
Name :
</td>
<td>
<asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
EMail ID :
</td>
<td>
<asp:TextBox ID="txtEm" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td style="width:50px"><b>Note :</b></td>
<td><b>This test consists of 15 questions. Maximum time allowed for the test is 15 minutes. Each question carries 1 point.</b></td>
</tr>
<tr>
<td></td>
<td><b>All the best!</b></td>
</tr>
<tr>
<td></td>
<td align="right"><asp:Button ID="btnSubmit" OnClick="submit_click" OnClientClick="return validate();" runat="server" Text="Start Test"/></td>
</tr>
</table>
</div>
</form>
</asp:Content>

