using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mdp_admin_SendEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin_id"] == null)
            Response.Redirect("Login");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            bool i = MailSender.SendEmail("admin@usedstuffs.info", txtUser.Text,txtPass.Text, txtFN.Text, txtSub.Text,txtMsg.Text, "");
            if(i)
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Mail sent successfully...';</script>", false);
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in sending mail';</script>", false);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in sending mail';</script>", false);
        }
    }
}