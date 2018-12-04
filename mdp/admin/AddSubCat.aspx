<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddSubCat.aspx.cs" Inherits="mdp_admin_AddSubCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
        var c = document.getElementById("ContentPlaceHolder1_drpCat").value;
        if (c == "0") {
            val.innerHTML = "Please select category";
            document.getElementById("ContentPlaceHolder1_drpCat").focus();
            return false;
        }
        if (fn.trim() == "") {
            val.innerHTML = "Please enter Subcategory name";
            document.getElementById("ContentPlaceHolder1_txtFN").focus();
            return false;
        }
       
    }
</script>
<form id="frm" runat="server" class="frm">
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Add Subcategory</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
    <tr>
        	<td class="tdata" style="width:13%"><label for="name">Category*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpCat" runat="server" CssClass="elemText" Width="25%">
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Subcategory Name*:</label></td>
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

