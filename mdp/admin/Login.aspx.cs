using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin_Login : System.Web.UI.Page
{
    AdminBal bal = new AdminBal();
    AdminProp p = new AdminProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void submitClick(object sender,EventArgs e)
    {
        p._tag = 2;
        dt = bal.fetchBal(p);
        DataRow[] dr = dt.Select("Username='" + txtUser.Text + "' and Password='" + MailSender.base64Encode(txtPass.Text) + "'");
        if (dr.Length == 1)
        {
            Session["Admin_id"] = dr[0]["admin_id"];
            Response.Redirect("AdminHome");
        }
        else
            val.InnerHtml = "Invalid username or password! Please try again";
    }
}