<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="frm" runat="server">
 <dl id="browse">
      <dt>My Account</dt>
      <dd class="first"><a href="ChangePass">Change Password</a></dd>
      <dd><asp:LinkButton ID="linkUp" runat="server" Text="Update Profile" OnClick="up_click"></asp:LinkButton></dd>
      </dl>
      <table border="0">
      <tr>
     <td>
     <div style="color:Orange; font-size:20pt; font-weight:bold; font-family:Cursive; text-align:center">My Products</div>
      <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
     <asp:Repeater ID="rptProd" runat="server">
     <ItemTemplate>
     <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></div>
                 <div class="product_img"><img id="Img1" height="50" width="50" src='<%#"~/Photos/"+Eval("Photo") %>' runat="server" alt="" title="" border="0" /></div>
                 <div class="prod_price"><span class="price"><asp:Label ID="lblPrice" runat="server" Text='<%#"Rs."+Eval("Price") %>'></asp:Label></span>
       
                 </div>                        
            </div>
            <div class="bottom_prod_box"></div>             
            <div class="prod_details_tab">          
            <asp:LinkButton ID="linkEdit" runat="server" CssClass="prod" Text="Edit" OnClick="edit_click" CommandArgument='<%#Eval("Prod_ID") %>'></asp:LinkButton>         
            </div>                     
        </div>
        </ItemTemplate>
        </asp:Repeater>
        </td>
        </tr>
        <tr>
        <td>
        <div style="overflow:hidden">
        <asp:Repeater ID="rptPaging1" runat="server" onitemcommand="rptPaging_ItemCommand">
            <ItemTemplate>
                                <asp:LinkButton ID="btnPage" PostBackUrl="~/Account"
                 style="padding:8px; margin:2px; background:#ffa100; border:solid 1px #666; font:8pt tahoma;"
                CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                 runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %>
                                </asp:LinkButton>
           </ItemTemplate>
        </asp:Repeater>
        </div>
        <asp:Label ID="lblPage" runat="server"></asp:Label>
        </td>
        </tr>
      </table>
      </form>
</asp:Content>

