using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

public partial class UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserBal Bal = new UserBal();
        UserProp p = new UserProp();
        DataTable dt = new DataTable();
        if (!IsPostBack)
        {
            if (Session["User_ID"] == null)
            {
                welcome.Visible = false;
                log.InnerHtml = "Login";
                log.HRef = "Login";
                sign.Visible = true;
                div.Visible = true;
            }
            else
            {
                log.InnerHtml = "Logout";
                log.HRef = "Logout";
                welcome.Visible = true;
                p._tag = 5;
                p._ID = Convert.ToInt16(Session["User_ID"]);
                dt = Bal.fetchBal(p);
                welcome.InnerHtml = "Welcome " + dt.Rows[0]["FN"].ToString();
                sign.Visible = false;
                div.Visible = false;

            }
        }
    }
}
