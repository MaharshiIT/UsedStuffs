<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddBanner.aspx.cs" Inherits="mdp_admin_AddBanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var h = document.getElementById("ContentPlaceHolder1_hid").value
        var fp = document.getElementById("ContentPlaceHolder1_fp").value;
        var c = document.getElementById("ContentPlaceHolder1_drpPos").value;
        if (h == "0") {
            if (fp == "") {
                val.innerHTML = "Please select image";
                document.getElementById("ContentPlaceHolder1_fp").focus();
                return false;
            }
            if (fp != "") {
                var fpL = fp.toLowerCase();
                if (fpL.indexOf(".jpg") == -1 && fpL.indexOf(".jpeg") == -1 && fpL.indexOf(".gif") == -1 && fpL.indexOf(".png") == -1 && fpL.indexOf(".tiff") == -1) {
                    val.innerHTML = "Invalid image format";
                    return false;
                }
            }
            if (c == "0") {
                val.innerHTML = "Please select position";
                document.getElementById("ContentPlaceHolder1_drpPos").focus();
                return false;
            }
        }
        else {
            if (fp != "") {
                var fpL = fp.toLowerCase();
                if (fpL.indexOf(".jpg") == -1 && fpL.indexOf(".jpeg") == -1 && fpL.indexOf(".gif") == -1 && fpL.indexOf(".png") == -1 && fpL.indexOf(".tiff") == -1) {
                    val.innerHTML = "Invalid image format";
                    return false;
                }
            }
            if (c == "0") {
                val.innerHTML = "Please select position";
                document.getElementById("ContentPlaceHolder1_drpPos").focus();
                return false;
            }
        }

        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "AddBanner", false, false));
    }
</script>
<form id="frm" runat="server" class="frm">
<asp:HiddenField ID="hid" runat="server" Value="0" />
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Add Banner</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
     <tr>
        	<td class="tdata" style="width:13%"><label for="name">Banner*:</label></td>
            <td class="tdata"><asp:Image runat="server" ID="imgBan" Height="50" Width="50" Visible="false" /><asp:FileUpload ID="fp" runat="server" CssClass="elemText" Width="25%" MaxLength="50" />
            </td>
        </tr>
     <tr>
        	<td class="tdata" style="width:13%"><label for="name">Link :</label></td>
            <td class="tdata"><asp:TextBox ID="txtFN" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
    <tr>
        	<td class="tdata" style="width:13%"><label for="name">Position*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpPos" runat="server" CssClass="elemText" Width="25%">
            <asp:ListItem Value="0">--Please select--</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>
            </td>
        </tr>
       
        </table>
         <p style="text-align:right">
       <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="but" 
            OnClientClick="return check();" OnClick="btnSubmit_Click" PostBackUrl="~/mdp/admin/AddBanner"/></p>
        </asp:Panel>
        </ContentTemplate>
        <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
        </asp:UpdatePanel>
        </form>
</asp:Content>

