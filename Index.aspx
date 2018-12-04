<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Begin BidVertiser code -->
<SCRIPT LANGUAGE="JavaScript1.1" SRC="http://bdv.bidvertiser.com/BidVertiser.dbm?pid=556573&bid=1396359" type="text/javascript"></SCRIPT>
<noscript><a href="http://www.bidvertiser.com/bdv/BidVertiser/bdv_publisher_toolbar_creator.dbm">custom toolbar</a></noscript>
<!-- End BidVertiser code --> 

<form id="frm" runat="server">
  <div class="left_content">
    <div class="title_box">Categories</div>
    

    <div class="sidebarmenu">
    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rptBound">
    <ItemTemplate>
        <a href="" class="menuitem odd"><asp:HiddenField ID="hid" runat="server" Value='<%#Eval("Cat_ID") %>' /><asp:Label ID="lblCat" runat="server" Text='<%#Eval("Name") %>'></asp:Label></a>
        <div class="even">
        <ul>
        <asp:Repeater ID="rptSub" runat="server" OnItemDataBound="bound">
        <ItemTemplate>
        <li>
        <asp:HiddenField ID="hid" runat="server" Value='<%#Eval("Sub_ID") %>' />
        <asp:HyperLink ID="link" runat="server"><asp:Label ID="lblSub" runat="server" Text='<%#Eval("SubName") %>'></asp:Label></asp:HyperLink>
        </li>
        </ItemTemplate></asp:Repeater>
        </ul>
        </div>
        </ItemTemplate>
        </asp:Repeater>
          </div>
        
        
     <div class="title_box">Latest Product</div>  
     <div class="border_box">
         <div class="product_title"><a runat="server" id="aName" href=""><asp:Label ID="lblProd" runat="server"></asp:Label></a></div>
         <div class="product_img"><a runat="server" id="aImg" href=""><img id="imgProd" height="120" width="120" runat="server" alt="" title="" border="0" /></a></div>
         <div class="prod_price"><span class="price"><asp:Label ID="lblPrice" runat="server"></asp:Label></span></div>
     </div>  
     
     
      
        
    
   </div>
   <div class="center_content">
   <h1 style="font-size:25pt">10 household stuffs you can reuse</h1>
   <ol>
   <li>Reuse old spray bottles by first making sure they are okay to reuse (see the back of the bottle) and filling them with water to spray plants.</li>
   <li>Never throw away an old book, donate it to a library or to your recycling center, or a school! They can reuse it.</li>
   <li>If you receive a gift in a gift bag, save it for another occasion and reuse that bag!</li>
   <li>Reuse old picture frames as serving tray.</li>
   <li>Reuse insulation when building a home, or adding insulation. This will save energy and money!</li>
   <li>Reuse your old paint by finding things to paint in your home, touch up, or donate it to a local charity.</li>
   <li> Reuse newspaper, interesting magazines, and other paper products by using them as wrapping paper.</li>
   <li>Cut used pieces of paper into scrap pieces of paper (a message pad!).</li>
   <li>Reuse your old toothbrush and use it to clean hard to reach areas like around the sink, your drains, faucets and grout.</li>
   <li>Reuse old curtains as rags for cleaning your car.</li>
   </ol>
   </div>


   <div class="right_content">
   <asp:Label ID="lblIP" runat="server" CssClass="crumb_navigation"></asp:Label>
   		<div class="title_box">Advertisement</div>  
     <div class="border_box">
        <ul class="rslides">
        <asp:Repeater ID="rptBan" runat="server">
        <ItemTemplate>
        <li><a href='<%#Eval("Link") %>' target="_blank"><img id="Img1" runat="server" src='<%#"~/banners/"+Eval("Name") %>' /></a></li>
        </ItemTemplate>
        </asp:Repeater>
        </ul>
     </div>  
     <div>
     <img src="images/bg_infobox.gif" style="width:100%" />
     <asp:Label ID="lblMsg" runat="server"></asp:Label>
     </div>
     
     
   
     
   </div></form>
</asp:Content>

