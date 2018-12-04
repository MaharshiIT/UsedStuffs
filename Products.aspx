<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function drpChange() {
        var d = document.getElementById("ContentPlaceHolder1_drpSearch").value;
        if (d == "Nam" || d == "Model" || d=="State" || d=="City") {
            document.getElementById("txt").style.display = 'inline';
            document.getElementById("drpC").style.display = 'none';
            
        }
        else if (d == "CName") {
            document.getElementById("txt").style.display = 'none';
            document.getElementById("drpC").style.display = 'inline';
         
        }
       
       
        else {
            document.getElementById("txt").style.display = 'none';
            document.getElementById("drpC").style.display = 'none';
            
        }
    }
    function chkbox() {
        var c = document.getElementById("ContentPlaceHolder1_chk").checked;
        if (c == true)
            document.getElementById("drpP").style.display = 'inline';
            else
                document.getElementById("drpP").style.display = 'none'
    }
</script>
<form runat="server">
<asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
<div class="left_content">
    <div class="title_box">Categories</div>
    

    <div class="sidebarmenu">
    <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rptBound">
    <ItemTemplate>
        <a href="" class="menuitem odd"><asp:HiddenField ID="hid" runat="server" Value='<%#Eval("Cat_ID") %>' /><asp:Label ID="lblCat" runat="server" Text='<%#Eval("Name") %>'></asp:Label></a>
        <div class="even">
        <ul>
        <asp:Repeater ID="rptSub" runat="server" OnItemDataBound="bound1">
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
        
        
     <div class="title_box">Search Products</div>  
     <div class="border_box">
     <table border="0">
         <tr>
     <td>
     <span style="color: #666;font-size: 11px;font-weight: bold;">Search by:</span>
    <asp:DropDownList ID="drpSearch" onchange="drpChange();" runat="server">
    <asp:ListItem>All</asp:ListItem>
    <asp:ListItem Value="Nam">Name</asp:ListItem>
    <asp:ListItem Value="Model">Model</asp:ListItem>
    <asp:ListItem Value="CName">Category</asp:ListItem>
    <asp:ListItem Value="State">State</asp:ListItem>
    <asp:ListItem Value="City">City</asp:ListItem>
    </asp:DropDownList> 
    </td></tr>
    <tr><td>
    <div id="txt" style="display:none">
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    </div>
    <div id="drpC" style="display:none">
    <asp:DropDownList ID="drpCat" runat="server"></asp:DropDownList>
    </div>
    </td></tr>
    <tr><td>
    <asp:CheckBox ID="chk" runat="server" onclick="chkbox();" />Price Range
    </td></tr>
    <tr><td>
    <div id="drpP" style="display:none">
    <table border="0">
    <tr><td>
    From : <asp:TextBox ID="txtFrom" runat="server" Width="75%"></asp:TextBox></td></tr>
    <tr><td>To : <asp:TextBox ID="txtTo" runat="server" Width="80%"></asp:TextBox></td></tr></table>
    </div>
    </td></tr>
    <tr><td>
    <asp:ImageButton ID="btnSearch" runat="server" ToolTip="Search" ImageUrl="~/mdp/admin/images/search.png" OnClick="Search" PostBackUrl="~/Products"/>
     </td>
     </tr>
     </table>
     </div>  
     </div>
     <table border="0">
    
     <tr>
     <td>
     
      <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
     <asp:Repeater ID="rptProd" runat="server" OnItemDataBound="bound">
     <ItemTemplate>
     <div class="prod_box">
        	<div class="top_prod_box"></div>
            <div class="center_prod_box">            
                 <div class="product_title"><asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></div>
                 <div class="product_img"><img height="50" width="50" src='<%#"~/Photos/"+Eval("Photo") %>' runat="server" alt="" title="" border="0" /></div>
                 <div class="prod_price"><span class="price"><asp:Label ID="lblPrice" runat="server" Text='<%#"Rs."+Eval("Price") %>'></asp:Label></span>
                 <asp:HiddenField ID="hid" runat="server" Value='<%#Eval("Prod_ID") %>' />
                 </div>                        
            </div>
            <div class="bottom_prod_box"><asp:HyperLink ID="lnkBox1" runat="server"></asp:HyperLink></div>             
            <div class="prod_details_tab">          
            <asp:HyperLink ID="lnkDetail1" runat="server" CssClass="prod_details" Text="details"></asp:HyperLink>          
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
                                <asp:LinkButton ID="btnPage" PostBackUrl="~/Products"
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

