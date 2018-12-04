<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function check() {
        var User = document.getElementById("ContentPlaceHolder1_txtUser").value;
        var Pass = document.getElementById("ContentPlaceHolder1_txtPass").value;
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
        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ContentPlaceHolder1_btnSubmit", "", false, "", "Login", false, false));
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
      <h1 class="hd">Login</h1>
      <div id="val" runat="server" style="color:Red;font-weight:bold"></div>
        <p><label>Username:</label><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></p>
        
        <p><label>Password:</label><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></p>
        
        <p class="remember_me">
         New user? <a href="Signup">Click here to sign up</a>
        </p>
        <p class="submit"><asp:Button ID="btnSubmit" runat="server" PostBackUrl="~/Login" Text="Login" OnClick="submitClick" OnClientClick="return check();" /></p>
      
    </div>

    <div class="login-help">
      <p>Forgot username or password? <a href="Recovery">Click here</a></p>
    </div>
  </section>
   <%--<div class="right">
   		<div class="title_box">Advertisement</div>  
     <div class="border_box">
        <ul class="rslides">
        <asp:Repeater ID="rptBan" runat="server">
        <ItemTemplate>
        <li><a href='<%#Eval("Link") %>' target="_blank"><img id="Img1" runat="server" src='<%#"~/banners/"+Eval("Name") %>' /></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
     </div>  --%>
 
 </form>
</asp:Content>

