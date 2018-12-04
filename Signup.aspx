<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="ca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link rel="Stylesheet" type="text/css" href="CSS/regStyle.css" />

<script type="text/javascript">
   
    function validate() {
        if (document.getElementById("ContentPlaceHolder1_hid").value == "") {
            var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
            var ln = document.getElementById("ContentPlaceHolder1_txtLN").value;
            var em = document.getElementById("ContentPlaceHolder1_txtEm").value;
            var addr = document.getElementById("ContentPlaceHolder1_txtAddr").value;
            //    var cont = document.getElementById("ContentPlaceHolder1_drpCont").value;
            var state = document.getElementById("ContentPlaceHolder1_drpState").value;
            var city = document.getElementById("ContentPlaceHolder1_drpCity").value;
            //    var post = document.getElementById("ContentPlaceHolder1_drpPost").value;
            var phone = document.getElementById("ContentPlaceHolder1_txtMob").value;
            var gen1 = document.getElementById("ContentPlaceHolder1_rbMale").checked;
            var gen2 = document.getElementById("ContentPlaceHolder1_rbFemale").checked;
            var user = document.getElementById("ContentPlaceHolder1_txtUser").value;
            var pass = document.getElementById("ContentPlaceHolder1_txtPass").value;
            var rpass = document.getElementById("ContentPlaceHolder1_txtRPass").value;
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

            if (fn.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter first name";
                document.getElementById("ContentPlaceHolder1_txtFN").focus();
                return false;
            }
            if (ln.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter last name";
                document.getElementById("ContentPlaceHolder1_txtLN").focus();
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
            if (addr.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter address";
                document.getElementById("ContentPlaceHolder1_txtAddr").focus();
                return false;
            }
            //    if (cont == "0") {
            //        val.innerHTML = "Please select country";
            //        document.getElementById("ContentPlaceHolder1_drpCont").focus();
            //        return false;
            //    }
            if (city == "--Please select--") {
                document.getElementById("val").innerHTML = "Please select city";
                document.getElementById("ContentPlaceHolder1_drpCity").focus();
                return false;
            }
            if (state == "--Please select--") {
                document.getElementById("val").innerHTML = "Please select state";
                document.getElementById("ContentPlaceHolder1_drpState").focus();
                return false;
            }

            //    if (post == "0") {
            //        val.innerHTML = "Please select postcode";
            //        document.getElementById("ContentPlaceHolder1_drpPost").focus();
            //        return false;
            //    }
            if (phone.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter mobile number";
                document.getElementById("ContentPlaceHolder1_txtMob").focus();
                return false;
            }
            if (gen1 == false && gen2 == false) {
                document.getElementById("val").innerHTML = "Please select gender";
                document.getElementById("ContentPlaceHolder1_rbMale").focus();
                return false;
            }
            if (user.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter username";
                document.getElementById("ContentPlaceHolder1_txtUser").focus();
                return false;
            }
            if (pass.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter password";
                document.getElementById("ContentPlaceHolder1_txtPass").focus();
                return false;
            }
            if (pass.trim() != "") {
                if (pass.length < 6) {
                    document.getElementById("val").innerHTML = "Atleast 6 characters required for password";
                    document.getElementById("ContentPlaceHolder1_txtPass").focus();
                    return false;
                }
            }

            if (rpass != pass) {
                document.getElementById("val").innerHTML = "Password do not match";
                document.getElementById("ContentPlaceHolder1_txtRPass").focus();
                return false;
            }

        }
        else {
            var fn = document.getElementById("ContentPlaceHolder1_txtFN").value;
            var ln = document.getElementById("ContentPlaceHolder1_txtLN").value;
            var em = document.getElementById("ContentPlaceHolder1_txtEm").value;
            var addr = document.getElementById("ContentPlaceHolder1_txtAddr").value;
            //    var cont = document.getElementById("ContentPlaceHolder1_drpCont").value;
            var state = document.getElementById("ContentPlaceHolder1_drpState").value;
            var city = document.getElementById("ContentPlaceHolder1_drpCity").value;
            //    var post = document.getElementById("ContentPlaceHolder1_drpPost").value;
            var phone = document.getElementById("ContentPlaceHolder1_txtMob").value;
            var gen1 = document.getElementById("ContentPlaceHolder1_rbMale").checked;
            var gen2 = document.getElementById("ContentPlaceHolder1_rbFemale").checked;
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (fn.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter first name";
                document.getElementById("ContentPlaceHolder1_txtFN").focus();
                return false;
            }
            if (ln.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter last name";
                document.getElementById("ContentPlaceHolder1_txtLN").focus();
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
            if (addr.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter address";
                document.getElementById("ContentPlaceHolder1_txtAddr").focus();
                return false;
            }
            //    if (cont == "0") {
            //        val.innerHTML = "Please select country";
            //        document.getElementById("ContentPlaceHolder1_drpCont").focus();
            //        return false;
            //    }
            if (city == "--Please select--") {
                document.getElementById("val").innerHTML = "Please select city";
                document.getElementById("ContentPlaceHolder1_drpCity").focus();
                return false;
            }
            if (state == "--Please select--") {
                document.getElementById("val").innerHTML = "Please select state";
                document.getElementById("ContentPlaceHolder1_drpState").focus();
                return false;
            }

            //    if (post == "0") {
            //        val.innerHTML = "Please select postcode";
            //        document.getElementById("ContentPlaceHolder1_drpPost").focus();
            //        return false;
            //    }
            if (phone.trim() == "") {
                document.getElementById("val").innerHTML = "Please enter phone number";
                document.getElementById("ContentPlaceHolder1_txtMob").focus();
                return false;
            }
            if (gen1 == false && gen2 == false) {
                document.getElementById("val").innerHTML = "Please select gender";
                document.getElementById("ContentPlaceHolder1_rbMale").focus();
                return false;
            }
        }
    }

</script>
<form id="frm" runat="server" class="register">
<asp:HiddenField ID="hid" runat="server" value=""/>
<div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
<asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
<h1 id="head" runat="server">Sign Up</h1>
<asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><label>Please wait...</label></ProgressTemplate></asp:UpdateProgress>
            
            <fieldset class="row2">
                <legend>Personal Details
                </legend>
                <p class="p">
                    <label>First Name *
                    </label>
                     <asp:TextBox ID="txtFN" runat="server" MaxLength="50"></asp:TextBox>
                </p>
                <p class="p">
                    <label>Last Name *
                    </label>
                    <asp:TextBox ID="txtLN" runat="server" MaxLength="50"></asp:TextBox>
                </p>
                <p class="p">
                    <label>EMail *
                    </label>
                    <asp:TextBox ID="txtEm" runat="server" MaxLength="50"></asp:TextBox>
                </p>
                 <p class="p">
                    <label>Address *
                    </label>
                    <asp:TextBox ID="txtAddr" TextMode="MultiLine" runat="server" MaxLength="50"></asp:TextBox>
                </p>
                <p class="p">
                    <label>State *
                    </label>
                    <asp:DropDownList ID="drpState" runat="server" OnSelectedIndexChanged="StateChange" AutoPostBack="true"></asp:DropDownList>
                </p>
                <p class="p">
                    <label>City *
                    </label>
                    <asp:DropDownList ID="drpCity" runat="server"></asp:DropDownList>
                </p>
                <p class="p">
                    <label>Mobile *
                    </label>
                   <asp:TextBox ID="txtMob" runat="server" MaxLength="10"></asp:TextBox>
                   <cc1:FilteredTextBoxExtender ID="ftb" runat="server" TargetControlID="txtMob" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                </p>
                 <p class="p">
                    <label>Gender *</label>
                    <asp:RadioButton ID="rbMale" runat="server" GroupName="gender"/>
                    <label class="gender">Male</label>
                    <asp:RadioButton ID="rbFemale" runat="server" GroupName="gender"/>
                    <label class="gender">Female</label>
                </p>
               <p class="p">
             <cc1:NoBot ID="NoBot1" runat="server" CutoffWindowSeconds="15"
            ResponseMinimumDelaySeconds="3" CutoffMaximumInstances="4" />
               </p>
            </fieldset>
            <fieldset class="row1" runat="server" id="field">
                <legend>Account Details</legend>
                <p class="p">
                    <label>Username *
                    </label>
                    <asp:TextBox ID="txtUser" runat="server" MaxLength="50"></asp:TextBox>
                </p>
                <p class="p">
                    <label>Password*
                    </label>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                    <label>Repeat Password*
                    </label>
                    <asp:TextBox ID="txtRPass" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                </p>
                
            </fieldset>
            
            <div><asp:Button ID="btnSubmit" runat="server" Text="Sign Up" CssClass="button" 
            OnClientClick="return validate();" onclick="btnSubmit_Click"/></div>
            <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
            </ContentTemplate></asp:UpdatePanel>
            </form>
</asp:Content>

