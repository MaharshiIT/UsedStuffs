<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ProdDetails.aspx.cs" Inherits="ProdDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="JS/jquery.imageLens.js"></script>
<script type="text/javascript">
    $(function () {
        $("#ContentPlaceHolder1_img_01").imageLens();
        
    });
</script>

<style type="text/css">
  
.field label
{
    font-size:large;
    font-weight:bold;
}
.lbl
{
    font-size:large;
}
</style>
<form id="frm" runat="server">
<fieldset class="field">
<legend style="border:1px solid black">
Product Details
</legend>
<p>
<img runat="server" id="img_01" height="200" width="200"/>
</p>
<p>(Mouseover on image for magnifying view)</p>
<p>
<label>Posted : </label>
<asp:Label ID="lblPost" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<p>
<label>Name : </label>
<asp:Label ID="lblName" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Model : </label>
<asp:Label ID="lblModel" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Manufacturing Date : </label>
<asp:Label ID="lblDate" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Color : </label>
<asp:Label ID="lblColor" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Price : </label>
<asp:Label ID="lblPrice" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Specifications : </label>
<asp:Label ID="lblSpec" runat="server"></asp:Label>
</p>
</fieldset>
<fieldset class="field">
<legend style="border:1px solid black">Owner Details</legend>
<p>
<label>Owner Name : </label>
<asp:Label ID="lblOwn" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Address : </label>
<asp:Label ID="lblAdd" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<label>Contact Number : </label>
<asp:Label ID="lblContact" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
<p>
<label>EMail : </label>
<asp:Label ID="lblmail" runat="server" CssClass="lbl"></asp:Label>
</p>
<p>
</fieldset>
</form>
</asp:Content>

