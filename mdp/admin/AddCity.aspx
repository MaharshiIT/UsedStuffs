<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="mdp_admin_AddCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
        var c = document.getElementById("ContentPlaceHolder1_drpCat").value;
        if (c == "0") {
            val.innerHTML = "Please select state";
            document.getElementById("ContentPlaceHolder1_drpCat").focus();
            return false;
        }
        if (fn.trim() == "") {
            val.innerHTML = "Please enter city";
            document.getElementById("ContentPlaceHolder1_txtFN").focus();
            return false;
        }

    }
</script>
<form id="frm" runat="server" class="frm">
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Add City</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
    <tr>
        	<td class="tdata" style="width:13%"><label for="name">State*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpCat" runat="server" CssClass="elemText" Width="25%">
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">City*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtFN" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
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

