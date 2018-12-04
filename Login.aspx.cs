using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    UserBal bal = new UserBal();
   UserProp p = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
           
        //    pB._tag = 2;
        //    dt = balB.fetchBal(pB);
        //    rptBan.DataSource = dt;
        //    rptBan.DataBind();
        //}
    }
    protected void submitClick(object sender, EventArgs e)
    {
        p._tag = 2;
        dt = bal.fetchBal(p);
        DataRow[] dr = dt.Select("Username='" + txtUser.Text + "' and Password='" + MailSender.base64Encode(txtPass.Text) + "'");
        if (dr.Length == 1)
        {
            Session["User_id"] = dr[0]["User_ID"];
            p._tag = 13;
            p._ID = Convert.ToInt16(Session["User_id"]);
            dt = bal.fetchBal(p);
            if (dt.Rows.Count > 0)
            {
                p._tag = 14;
                p._ID = Convert.ToInt16(Session["User_id"]);
                int j = bal.AddBal(p);
            }
            p._tag = 9;
            p._ID = Convert.ToInt16(Session["User_id"]);
            dt = bal.fetchBal(p);
            p._tag = 12;
            p._ID = Convert.ToInt16(Session["User_id"]);
            p._FN = dt.Rows[0]["Name"].ToString();
            int i = bal.AddBal(p);
            Response.Redirect("Index");
        }
        else
            val.InnerHtml = "Invalid username or password! Please try again";
    }
}