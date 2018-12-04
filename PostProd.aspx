<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="PostProd.aspx.cs" Inherits="PostProd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="CSS/prodStyle.css" type="text/css" rel="Stylesheet" />
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
                document.getElementById("val").innerHTML = "Please select category";
                document.getElementById("ContentPlaceHolder1_drpCat").focus();
                return false;
            }
            if (s == "0") {
                document.getElementById("val").innerHTML = "Please select Subcategory";
                document.getElementById("ContentPlaceHolder1_drpSub").focus();
                return false;
            }
            if (fn.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter product name";
                document.getElementById("ContentPlaceHolder1_txtName").focus();
                return false;
            }
            //            if (u.trim() == "") {
            //                val.innerHTML = "Please enter user";
            //                document.getElementById("ContentPlaceHolder1_txtUser").focus();
            //                return false;
            //            }
            if (m.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter model";
                document.getElementById("ContentPlaceHolder1_txtModel").focus();
                return false;
            }
            if (dt != "") {
                var v = validateDate();
                if (v == false) {
                    document.getElementById("val").innerHTML = "Invalid Date!";
                    document.getElementById("ContentPlaceHolder1_txtYear").focus();
                    return false;
                }
            }
            if (p.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter price";
                document.getElementById("ContentPlaceHolder1_txtPrice").focus();
                return false;
            }
            if (fp != "") {
                var fpL = fp.toLowerCase();
                if (fpL.indexOf(".jpg") == -1 && fpL.indexOf(".jpeg") == -1 && fpL.indexOf(".gif") == -1 && fpL.indexOf(".png") == -1 && fpL.indexOf(".tiff") == -1) {
                    document.getElementById("val").innerHTML = "Invalid image format";
                    return false;
                }


            }
            WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "PostProd", false, false));
        } catch (ee) {
            WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "PostProd", false, false));
        }
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
//            var dd = dt1.getDate();
//            var mm = dt1.getMonth() + 1;
//            var yy = dt1.getFullYear();
//            var dtN = mm + "/" + dd + "/" + yy;
            
            var dt2 = new Date();
            
//            var dd1 = dt2.getDate();
//            var mm1 = dt2.getMonth() + 1;
//            var yy1 = dt2.getFullYear();
//            var dtC = dd1 + "/" + mm1 + "/" + yy1;
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
    function textChanged(ftb) {
        if (ftb.GetHtml().length <= 500)
            document.getElementById("text").innerHTML = (500 - ftb.GetHtml().length) + " chars left";
        else
            document.getElementById("text").innerHTML = "0 chars left";
        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "PostProd", false, false));
    }
</script>
<div class="wrapper">

		<form class="form2" runat="server">
        <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    
			<div class="formtitle" id="title" runat="server">Post Product</div>
            <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
            <div><asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><label>Please wait...</label></ProgressTemplate></asp:UpdateProgress></div>
            <div>Note : Fields marked with * are mandatory</div>
            <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
			<div class="input">
				<div class="inputtext">Category*: </div>
				<div class="inputcontent">

					<asp:DropDownList ID="drpCat" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpChange" Width="100%">
            </asp:DropDownList>

				</div>
			</div>

			<div class="input">
				<div class="inputtext">Subcategory*: </div>
				<div class="inputcontent">

					<asp:DropDownList ID="drpSub" runat="server"  Width="100%"></asp:DropDownList>

				</div>
			</div>

			<div class="input">
				<div class="inputtext">Name*: </div>
				<div class="inputcontent">

					<asp:TextBox ID="txtName" runat="server"  Width="100%" MaxLength="50">
                    </asp:TextBox>

				</div>
			</div>

			<div class="input">
				<div class="inputtext">Model*:</div>
				<div class="inputcontent">

					<asp:TextBox ID="txtModel" runat="server"  Width="100%" MaxLength="50">
                    </asp:TextBox>

				</div>
			</div>
            <div class="input">
				<div class="inputtext">Manufacturing Date:</div>
				<div class="inputcontent">

					<asp:TextBox ID="txtYear" runat="server"  Width="100%">
            </asp:TextBox>&nbsp&nbsp(dd/mm/yyyy)
            <cc1:CalendarExtender ID="cal" runat="server" TargetControlID="txtYear"  Format="dd/MM/yyyy"></cc1:CalendarExtender>
				</div>
			</div>
            <div class="input">
				<div class="inputtext">Color:</div>
				<div class="inputcontent">

					<asp:TextBox ID="txtColor" runat="server"  Width="100%">
            </asp:TextBox>

				</div>
			</div>
            <div class="input">
				<div class="inputtext">Price*:</div>
				<div class="inputcontent">

		    <asp:TextBox ID="txtPrice" runat="server"  Width="100%" MaxLength="6">
            </asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftb" runat="server" TargetControlID="txtPrice" FilterType="Numbers,Custom" ValidChars="."></cc1:FilteredTextBoxExtender>
				</div>
			</div>
            <div class="input">
				<div class="inputtext">Status*:</div>
				<div>

					<asp:RadioButton ID="rbS" runat="server" GroupName="gender" Width="20px"/><label>Sold</label><asp:RadioButton ID="rbU" Checked="true" runat="server" GroupName="gender" Width="20px"/><label>Unsold</label>


				</div>
			</div>
             <div class="input">
				<div class="inputtext">Photo(300px X Npx) :</div>
				<div class="inputcontent">

					<asp:Image runat="server" ID="imgBan" Height="50" Width="50" Visible="false" /><asp:FileUpload ID="fp" runat="server"  Width="70%"/>

				</div>
			</div>
            <div class="input">
				<div class="inputtext">Description:</div>
				<div class="textarea">

					<FTB:FreeTextBox ID="txtDesc" runat="server" Width="100%" ClientSideTextChanged="textChanged"></FTB:FreeTextBox>
                    (Max 500 chars) 
                    
				</div>
			</div>
            </ContentTemplate></asp:UpdatePanel>
            <div id = "text" style="color:Green"></div>
            
			<div class="buttons">

				 <asp:Button ID="btnSubmit" runat="server" Text="Post" CssClass="orangebutton" 
            OnClientClick="return check();" OnClick="btnSubmit_Click" PostBackUrl="~/mdp/admin/PosProd"/>

			</div>
            
		</form>

		

	</div>	

</asp:Content>

