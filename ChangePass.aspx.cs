using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ChangePass : System.Web.UI.Page
{
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User_id"] == null)
                Response.Redirect("Login");
        }
    }
    protected void submitClick(object sender, EventArgs e)
    {
        try{
        p._tag = 5;
        p._ID = Convert.ToInt16(Session["User_id"]);
        dt = bal.fetchBal(p);
        DataRow[] dr = dt.Select("Password='" + MailSender.base64Encode(txtUser.Text) + "'");
        if (dr.Length == 1)
        {
            p._tag = 8;
            p._ID = Convert.ToInt16(Session["User_id"]);
            p._Password = MailSender.base64Encode(txtPass.Text);
            int i = bal.AddBal(p);
            val.InnerHtml = "Password updated successfully...";
        }
        else
            val.InnerHtml = "Invalid old password";
        }catch(Exception ex)
        {
            val.InnerHtml = "Problem in connection";
        }
    }
}