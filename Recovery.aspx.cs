using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Recovery : System.Web.UI.Page
{
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_click(object sender, EventArgs e)
    {
        try
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            DataRow[] dr = dt.Select("EMail='" + txtEm.Text + "'");
            if (dr.Length == 0)
            {
                lblMsg.Text = "EMail ID not registered!";
                return;
            }
            if (dr.Length == 1)
            {
                string msg = "<html><head><title></title></head><body><table border='0'><tr><td>Your username and password for usedstuffs are:</td></tr><tr><td>Username : '" + dr[0]["Username"].ToString() + "'</td></tr><tr><td>Password : '" + MailSender.base64Decode(dr[0]["Password"].ToString()) + "'</td></tr></table></body></html>";
                bool m = MailSender.SendEmail("maharshib5@gmail.com","maharshib5@gmail.com", "9925588103", txtEm.Text, "Account Recovery",msg, "");
                lblMsg.Text = "Username and password sent to your EMail ID";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Problem occured in sending EMail";
        }
    }
}