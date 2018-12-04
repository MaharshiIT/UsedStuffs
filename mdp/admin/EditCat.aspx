<%@ Page Title="" Language="C#" MasterPageFile="~/mdp/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EditCat.aspx.cs" Inherits="mdp_admin_EditCat" %>

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
    <h1>View/Edit Categories</h1>
    <asp:UpdateProgress ID="Prog" runat="server" AssociatedUpdatePanelID="up1"><ProgressTemplate><img src="images/loader.gif" alt="" /></ProgressTemplate></asp:UpdateProgress>
    <asp:Label ID="lblMsg" runat="server" CssClass="lblMsg"></asp:Label> 
    <asp:GridView ID="gridAdmin" runat="server" AllowSorting="true" AutoGenerateColumns="false" OnSorting="Sort"  CssClass="rounded-corner">
    <Columns>
    <asp:TemplateField HeaderStyle-Width="1%" ItemStyle-Width="1%">
    <HeaderTemplate>
    <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll();"/>
    </HeaderTemplate>
    <ItemTemplate>
    <asp:CheckBox ID="chk" runat="server" onclick="check();"/>
    <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("Cat_ID") %>' />
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Name" SortExpression="Name">
    <ItemTemplate>
    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Edit">
    <ItemTemplate>
    <asp:ImageButton ID="btnEdit" runat="server" ToolTip="Edit" ImageUrl="~/mdp/admin/images/user_edit.png" OnClick="btnClick" CommandArgument='<%#Eval("Cat_ID") %>' />
 
    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    </asp:GridView>
    <asp:Button ID="btnDel" runat="server" OnClick="Delete" Text="Delete" OnClientClick="return checkDel();"/>
</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>
</form>
</asp:Content>

