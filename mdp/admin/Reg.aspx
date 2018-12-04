<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="admin_Reg" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

   <%-- <script type="text/javascript" charset="utf-8">
      $(function(){
        $("input:checkbox, input:radio, input:file, select").uniform();
      });
      </script>--%>
      <script type="text/javascript" src="js/Validation.js"></script>
       <script type="text/javascript">
           function clr() {
               try {
                   document.getElementById("ContentPlaceHolder1_txtFN").value = "";
                   document.getElementById("ContentPlaceHolder1_txtLN").value = "";
                   document.getElementById("ContentPlaceHolder1_txtEm").value = "";
                   document.getElementById("ContentPlaceHolder1_txtAddr").value = "";
                   //    var cont = document.getElementById("ContentPlaceHolder1_drpCont").value;
                   document.getElementById("ContentPlaceHolder1_drptate").value = "--Please select--";
                   document.getElementById("ContentPlaceHolder1_drpCity").value = "--Please select--";
                   //    var post = document.getElementById("ContentPlaceHolder1_drpPost").value;
                   document.getElementById("ContentPlaceHolder1_txtMob").value = "";
                   document.getElementById("ContentPlaceHolder1_rbMale").checked = false;
                   document.getElementById("ContentPlaceHolder1_rbFemale").checked = false;
                   document.getElementById("ContentPlaceHolder1_txtUser").value = "";
                   document.getElementById("ContentPlaceHolder1_txtPass").value = "";
               } catch (eee) { alert(eee.Message); }
           }
       </script>
    <form id="frm" runat="server" class="frm">
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server" DefaultButton="btnSubmit">
    <h1>Add Admin</h1>
    <div id="val" style="font-weight:bold; text-align:center; color:Red"></div>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>  
	<table id="tb" border="0" width="100%">
        <tr>
        	<td class="tdata" style="width:13%"><label for="name">First Name*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtFN" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            <span style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">Last Name*:</span><span style="margin-left:4%"><asp:TextBox ID="txtLN" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox></span>
            </td>
        </tr>
        <tr>
        	<td class="tdata"><label for="email">Email*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtEm" runat="server" CssClass="elemText"></asp:TextBox></td>
        </tr>
       <tr>
        	<td class="tdata"><label for="email">Address*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtAddr" runat="server" CssClass="elemText" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
       <tr>
        	<td class="tdata"><label for="email">State*:</label></td>
            <td class="tdata"><asp:DropDownList ID="drpState" runat="server" CssClass="elemText" Width="25%" OnSelectedIndexChanged="StateChange" AutoPostBack="true"></asp:DropDownList>
            <span style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">City*:</span><span style="margin-left:4%"><asp:DropDownList ID="drpCity" runat="server" CssClass="elemText" Width="25%"></asp:DropDownList></span>
            </td>
        </tr>
        <tr>
        	<td class="tdata"><label for="email">Phone*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtMob" runat="server" CssClass="elemText" MaxLength="15"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftb" runat="server" TargetControlID="txtMob" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
            </td>
        </tr>
       <tr>
        	<td class="tdata"><label for="email">Gender*:</label></td>
            <td class="tdata"><span style="color:#666; font-size:11px; font-weight:bold">Male:</span><asp:RadioButton ID="rbMale" runat="server" GroupName="gender"/>
            <span style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">Female:</span><asp:RadioButton ID="rbFemale" runat="server" GroupName="gender"/>
            </td>
        </tr>
        <tr>
        	<td class="tdata"><label for="name">Username*:</label></td>
            <td class="tdata"><asp:TextBox ID="txtUser" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox>
            <span id="sPass" runat="server" style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">Password*:</span><span id="stxtPass" runat="server" style="margin-left:4%"><asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox></span>
            <span id="sNPass" visible="false" runat="server" style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">New Password:</span><span id="sNtxtPass" visible="false" runat="server" style="margin-left:4%"><asp:TextBox ID="txtNewPass" TextMode="Password" runat="server" CssClass="elemText" Width="25%" MaxLength="50"></asp:TextBox></span>
            </td>
        </tr>
         <tr>
        	<td class="tdata"><label for="email">Added by:</label></td>
            <td class="tdata"><asp:TextBox ID="txtAdd" runat="server" Enabled="false" MaxLength="50" CssClass="elemText" Width="25%"></asp:TextBox>
            <span style="color:#666; font-size:11px; font-weight:bold; margin-left:20%">Modified by:</span><span style="margin-left:4%"><asp:TextBox ID="txtEdit" Enabled="false" runat="server" MaxLength="50" CssClass="elemText" Width="25%"></asp:TextBox></span>
            </td>
        </tr>
	</table>
    <p style="text-align:right">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="but" 
            OnClientClick="return validate();" onclick="btnSubmit_Click"/>
        <asp:Button ID="Button1" runat="server" Text="Reset" CssClass="but" OnClientClick="clr();return false;" />
    </p>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    

</asp:Content>

