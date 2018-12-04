<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="SendSms.aspx.cs" Inherits="mdp_admin_SendSms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
        var u = document.getElementById("ContentPlaceHolder1_txtUser").value;
        var p = document.getElementById("ContentPlaceHolder1_txtPass").value;
        var m = var fn = document.getElementById("ContentPlaceHolder1_txtMsg").value;
        if (fn.trim() == "") {
            val.innerHTML = "Please enter to address";
            document.getElementById("ContentPlaceHolder1_txtFN").focus();
            return false;
        }
        if (u.trim() == "") {
            val.innerHTML = "Please enter username";
            document.getElementById("ContentPlaceHolder1_txtUser").focus();
            return false;
        }
        if (p.trim() == "") {
            val.innerHTML = "Please enter password";
            document.getElementById("ContentPlaceHolder1_txtPass").focus();
            return false;
        }
        if (m.trim() == "") {
            val.innerHTML = "Please enter message";
            document.getElementById("ContentPlaceHolder1_txtMsg").focus();
            return false;
        }
    }
</script>
<form id="frm" runat="server" class="frm">
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Send SMS</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">To*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtFN" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
         <tr>
        	<td class="tdata" style="width:13%"><label for="name">Username*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtUser" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
         <tr>
        	<td class="tdata" style="width:13%"><label for="name">Password*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
         <tr>
        	<td class="tdata" style="width:13%"><label for="name">Message*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtMsg" TextMode="MultiLine" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        </table>
         <p style="text-align:right">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="but" 
            OnClientClick="return check();" OnClick="btnSubmit_Click"/></p>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
        </form>
</asp:Content>

