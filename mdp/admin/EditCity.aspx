<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EditCity.aspx.cs" Inherits="mdp_admin_EditCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function checkAll() {
        var grid = document.getElementById("ContentPlaceHolder1_gridAdmin");
        var input = grid.getElementsByTagName('input');
        var hC = parseInt(document.getElementById("ContentPlaceHolder1_hidCount").value);
        var f;
        for (var i = 0; i < input.length; i++) {
            if (input[i].type == "checkbox") {
                if (input[i].id == "ContentPlaceHolder1_gridAdmin_chkAll") {
                    if (input[i].checked)
                        f = 1;
                    else
                        f = 0;
                }
            }
        }
        if (f == 1) {
            for (var i = 0; i < hC + 1; i++) {
                var e2 = grid.rows[i].getElementsByTagName('input');
                if (e2[0].type == "checkbox")
                    e2[0].checked = true;

            }
        }
        else {
            for (var i = 0; i < hC + 1; i++) {
                var e2 = grid.rows[i].getElementsByTagName('input');
                if (e2[0].type == "checkbox")
                    e2[0].checked = false;

            }
        }
    }
    function check() {
        var grid = document.getElementById("ContentPlaceHolder1_gridAdmin");
        var input = grid.getElementsByTagName('input');
        var hC = parseInt(document.getElementById("ContentPlaceHolder1_hidCount").value);
        var f;
        var c = 0;
        for (var i = 1; i < hC + 1; i++) {
            var e = grid.rows[i].getElementsByTagName('input');
            if (e[0].type == "checkbox") {
                if (e[0].id != "ContentPlaceHolder1_gridAdmin_chkAll") {
                    if (e[0].checked) {
                        c++;
                    }
                }

            }
        }
        if (c == hC) {
            var i = grid.rows[0].getElementsByTagName('input');
            i[0].checked = true;
        }
        else {
            var i = grid.rows[0].getElementsByTagName('input');
            i[0].checked = false;
        }

    }
    function checkDel() {
        var grid = document.getElementById("ContentPlaceHolder1_gridAdmin");
        var input = grid.getElementsByTagName('input');
        var c = 0;
        for (var i = 0; i < input.length; i++) {
            if (input[i].type == "checkbox") {
                if (input[i].checked)
                    c++;
            }
        }
        if (c == 0) {
            alert("Please select atleast one record to delete");
            return false;
        }
    }      
</script>
 <form id="frm" class="frm" runat="server">
  <asp:HiddenField ID="hidCount" runat="server" Value="" />
    <asp:ScriptManager ID="scrpt" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="up1" runat="server"><ContentTemplate>
    <asp:Panel ID="panAdmin" runat="server">
    <h1>View/Edit Cities</h1>
   <div style="margin-bottom:5px">
    <span style="color: #666;font-size: 11px;font-weight: bold;">Search by:</span>
    <asp:DropDownList ID="drpSearch" CssClass="dropSearch" runat="server">
    <asp:ListItem>--Please select--</asp:ListItem>
    <asp:ListItem Value="City">City</asp:ListItem>
    <asp:ListItem Value="State">State</asp:ListItem>
    </asp:DropDownList> 
    <asp:TextBox ID="txtSearch" runat="server" CssClass="search_input"></asp:TextBox>
    <asp:ImageButton ID="btnSearch" runat="server" ToolTip="Search" ImageUrl="~/mdp/admin/images/search.png" OnClick="Search" CssClass="search_submit" /><asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress></div>
    <asp:Label ID="lblMsg" runat="server" CssClass="lblMsg"></asp:Label> 
    <asp:GridView ID="gridAdmin" runat="server" AllowPaging="true" OnPageIndexChanging="pageChange" PageSize="20" AllowSorting="true" AutoGenerateColumns="false" OnSorting="Sort"  CssClass="rounded-corner">
    <Columns>
    <asp:TemplateField HeaderStyle-Width="1%" ItemStyle-Width="1%">
    <HeaderTemplate>
    <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll();"/>
    </HeaderTemplate>
    <ItemTemplate>
    <asp:CheckBox ID="chk" runat="server" onclick="check();"/>
    <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("City_ID") %>' />
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="State" SortExpression="State">
    <ItemTemplate>
    <asp:Label ID="lblSName" runat="server" Text='<%#Eval("State") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="City" SortExpression="City">
    <ItemTemplate>
    <asp:Label ID="lblName" runat="server" Text='<%#Eval("City") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Edit">
    <ItemTemplate>
    <asp:ImageButton ID="btnEdit" runat="server" ToolTip="Edit" ImageUrl="~/mdp/admin/images/user_edit.png" OnClick="btnClick" CommandArgument='<%#Eval("City_ID") %>' />
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    <PagerSettings Mode="NumericFirstLast" FirstPageText="<<first" LastPageText="last>>" PageButtonCount="5" />
    <PagerStyle CssClass="pagination" /> 
    </asp:GridView>
    <asp:Button ID="btnDel" runat="server" OnClick="Delete" Text="Delete" OnClientClick="return checkDel();"/>
</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>
</form>
</asp:Content>

