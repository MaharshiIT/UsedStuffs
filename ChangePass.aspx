<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var User = document.getElementById("ContentPlaceHolder1_txtUser").value;
        var Pass = document.getElementById("ContentPlaceHolder1_txtPass").value;
        var RPass = document.getElementById("ContentPlaceHolder1_txtRPass").value;
        if (User == "") {
            document.getElementById("ContentPlaceHolder1_val").innerHTML = "Please enter username";
            document.getElementById("ContentPlaceHolder1_txtUser").focus();
            return false;
        }
        if (Pass == "") {
            document.getElementById("ContentPlaceHolder1_val").innerHTML = "Please enter password";
            document.getElementById("ContentPlaceHolder1_txtPass").focus();
            return false;
        }
        if (Pass.length<6) {
            document.getElementById("ContentPlaceHolder1_val").innerHTML = "Atleast 6 characters required for password";
            document.getElementById("ContentPlaceHolder1_txtPass").focus();
            return false;
        }
        if (Pass != RPass) {
            document.getElementById("ContentPlaceHolder1_val").innerHTML = "Password do not match";
            document.getElementById("ContentPlaceHolder1_txtRPass").focus();
            return false;
        }
        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "ChangePass", false, false));
    }
</script>
        <link rel="stylesheet" type="text/css" href="css/loginStyle.css" />
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->  <!--<![endif]-->
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <form id="form1" runat="server">
  <section class="container">
    <div class="login">
      <h1 class="hd">Change Password</h1>
      <div id="val" runat="server" style="color:Red;font-weight:bold"></div>
        <p><label>Old Password:</label><asp:TextBox ID="txtUser" runat="server" TextMode="Password"></asp:TextBox></p>
        
        <p><label>New Password:</label><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></p>
        <p><label>Repeat New Password:</label><asp:TextBox ID="txtRPass" runat="server" TextMode="Password"></asp:TextBox></p>
        <p class="submit"><asp:Button ID="btnSubmit" runat="server" PostBackUrl="~/ChangePass" Text="Change Password" OnClick="submitClick" OnClientClick="return check();" /></p>
        </div>
  </section>
   
 </form>
</asp:Content>

