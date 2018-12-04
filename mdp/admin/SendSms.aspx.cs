using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mdp_admin_SendSms : System.Web.UI.Page
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
            sms1 s1 = new sms1();
            int i = s1.send(txtUser.Text, txtPass.Text, txtMsg.Text,txtFN.Text);
            if(i==1)
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='SMS sent successfully...';</script>", false);
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in sending SMS';</script>", false);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in sending SMS';</script>", false);
        }
    }
}