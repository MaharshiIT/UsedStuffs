using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_AdminMaster : System.Web.UI.MasterPage
{
    AdminBal bal = new AdminBal();
    AdminProp p = new AdminProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_id"] != null)
        {
            p._tag = 5;
            p._ID = Convert.ToInt16(Session["Admin_id"]);
            dt = bal.fetchBal(p);
            lblAdmin.Text = "Welcome " + dt.Rows[0]["FN"].ToString();
        }
        else
            Response.Redirect("Login");
    }
    protected void outClick(object sender, EventArgs e)
    {
        Session["Admin_id"] = null;
        Response.Redirect("Login");
    }
}
