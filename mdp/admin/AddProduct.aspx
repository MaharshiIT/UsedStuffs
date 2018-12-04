<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="mdp_admin_AddProduct" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        try {
            var fn = document.getElementById("ContentPlaceHolder1_txtName").value;
            var c = document.getElementById("ContentPlaceHolder1_drpCat").value;
            var s = document.getElementById("ContentPlaceHolder1_drpSub").value;
//            var u = document.getElementById("ContentPlaceHolder1_txtUser").value;
            var m = document.getElementById("ContentPlaceHolder1_txtModel").value;
            var p = document.getElementById("ContentPlaceHolder1_txtPrice").value;
            var fp = document.getElementById("ContentPlaceHolder1_fp").value;
            var dt = document.getElementById("ContentPlaceHolder1_txtYear").value;
            if (c == "0") {
                val.innerHTML = "Please select category";
                document.getElementById("ContentPlaceHolder1_drpCat").focus();
                return false;
            }
//            if (s == "0") {
//                val.innerHTML = "Please select Subcategory";
//                document.getElementById("ContentPlaceHolder1_drpSub").focus();
//                return false;
//            }
            if (fn.trim() == "") {
                val.innerHTML = "Please enter product name";
                document.getElementById("ContentPlaceHolder1_txtName").focus();
                return false;
            }
//            if (u.trim() == "") {
//                val.innerHTML = "Please enter user";
//                document.getElementById("ContentPlaceHolder1_txtUser").focus();
//                return false;
//            }
            if (m.trim() == "") {
                val.innerHTML = "Please enter model";
                document.getElementById("ContentPlaceHolder1_txtModel").focus();
                return false;
            }
            if (dt != "") {
                var v = validateDate();
                if (v == false) {
                    val.innerHTML = "Invalid Date!";
                    document.getElementById("ContentPlaceHolder1_txtYear").focus();
                    return false;
                }
            }
            if (p.trim() == "") {
                val.innerHTML = "Please enter price";
                document.getElementById("ContentPlaceHolder1_txtPrice").focus();
                return false;
            }
            if (fp != "") {
                var fpL = fp.toLowerCase();
                if (fpL.indexOf(".jpg") == -1 && fpL.indexOf(".jpeg") == -1 && fpL.indexOf(".gif") == -1 && fpL.indexOf(".png") == -1 && fpL.indexOf(".tiff") == -1) {
                    val.innerHTML = "Invalid image format";
                    return false;
                }
            }
           
        } catch (ee) {
        alert(ee);
    }
    WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "AddProduct", false, false));
}

function validateDate() {
    var DateOfBirth = document.getElementById("ContentPlaceHolder1_txtYear").value;
    if (DateOfBirth != "") {
        var Char1 = DateOfBirth.charAt(2);
        var Char2 = DateOfBirth.charAt(5);
        // alert(Char1); alert(Char2);

        var flag = false;

        if (Char1 == '/' && Char2 == '/') {
            // alert ('valid positions of non numeric characters.');
            flag = true;
        }
        else {
            // alert('invalid position of non numeric symbols');
            flag = false;
        }

        var day;
        var month;
        var year;

        var dt = DateOfBirth.split('/');
        var dtN = dt[1] + "/" + dt[0] + "/" + dt[2];
        var dt1 = new Date(dtN);
        var dt2 = new Date();
        day = DateOfBirth.substring(0, 2);
        month = DateOfBirth.substring(3, 5);
        year = DateOfBirth.substring(6, 10);

        if (validDay(day) && validMonth(month) && validYear(year) && (flag == true)) {
            if (dt1 >= dt2)
                return false;
                else
            return true;
        }
        else {
            return false;
        }
    }

} // end func

function IsNumeric(sText) {
    var ValidChars = "0123456789.";
    var IsNumber = true;
    var Char;

    for (i = 0; i < sText.length && IsNumber == true; i++) {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            IsNumber = false;
        }
    }

    return IsNumber;
} // end func


function validDay(day) {
    if (IsNumeric(day)) {
        if (day > 0 && day < 32) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }

} // end func


function validMonth(month) {
    if (IsNumeric(month)) {
        if (month > 0 && month < 13) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        return false;
    }
} // end func



function validYear(year) {
    var d = new Date();
    var currentYear = d.getFullYear();

    if (year.length != 4) { return false; }

    if (IsNumeric(year)) {
        if (year > 0 && year <= currentYear) {
            return true;
        }
        else {
            return false;
        }

    }
    else {
        return false;
    }

} // end func 
</script>
<form id="frm" runat="server" class="frm">
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Add Product</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
    <tr>
        	<td class="tdata" style="width:13%"><label for="name">Category*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpCat" runat="server" CssClass="elemText" AutoPostBack="true" OnSelectedIndexChanged="drpChange" Width="25%">
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Subcategory*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpSub" runat="server" CssClass="elemText" Width="25%">
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">User*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtUser" Enabled="false" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>
            </td>
        </tr>
         <tr>
        	<td class="tdata" style="width:13%"><label for="name">Name*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtName" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Model*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtModel" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Manufacturing Date :</label></td>
            <td class="tdata"><asp:TextBox ID="txtYear" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>&nbsp&nbsp(dd/mm/yyyy)
                <cc1:CalendarExtender ID="cal" runat="server" TargetControlID="txtYear"  Format="dd/MM/yyyy"></cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Color :</label></td>
            <td class="tdata"><asp:TextBox ID="txtColor" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Price*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtPrice" runat="server" CssClass="elemText" Width="25%">
            </asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftb" runat="server" TargetControlID="txtPrice" FilterType="Numbers,Custom" ValidChars="."></cc1:FilteredTextBoxExtender>
            </td>
        </tr>
         <tr>
        	<td class="tdata"><label for="email">Status :</label></td>
            <td class="tdata"><span style="color:#666; font-size:11px; font-weight:bold">Sold:</span><asp:RadioButton ID="rbS" runat="server" GroupName="gender"/>
            <span style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">Unsold:</span><asp:RadioButton ID="rbU" Checked="true" runat="server" GroupName="gender"/>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Photo :</label></td>
            <td class="tdata"><asp:Image runat="server" ID="imgBan" Height="50" Width="50" Visible="false" /><asp:FileUpload ID="fp" runat="server" CssClass="elemText" Width="25%"/>
            </td>
        </tr>
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">Description :</label></td>
            <td class="tdata"><FTB:FreeTextBox ID="txtDesc" runat="server" Width="100%"></FTB:FreeTextBox>
            </td>
        </tr>
        </table>
         <p style="text-align:right">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="but" 
            OnClientClick="return check();" OnClick="btnSubmit_Click" PostBackUrl="~/mdp/admin/AddProduct"/></p>
        </asp:Panel>
        </ContentTemplate>
        <Triggers><asp:PostBackTrigger ControlID="btnSubmit" /></Triggers>
        </asp:UpdatePanel>
         
        </form>
</asp:Content>

