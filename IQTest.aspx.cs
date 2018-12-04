using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IQTest : System.Web.UI.Page
{
    int c = 0;
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["eid"] == null)
                Response.Redirect("UserDetails");
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script", "<script type='text/javascript'>time();</script>", false);
                btnSubmit.Visible = true;
                res.Visible = false;
                score.Visible = false;
            }
        }
    }
    protected void submit_click(object sender, EventArgs e)
    {
        try
        {

            if (rb41.Checked)
            {
                c++;
                c1.Visible = true;
            }
            else
            {
                w1.Visible = true;
                lbl1.Text = "Correct : " + rb41.Text;
            }
            if (rb22.Checked)
            {
                c++;
                c2.Visible = true;
            }
            else
            {
                w2.Visible = true;
                lbl2.Text = "Correct : " + rb22.Text;
            }
            if (rb43.Checked)
            {
                c++;
                c3.Visible = true;
            }
            else
            {
                w3.Visible = true;
                lbl3.Text = "Correct : " + rb43.Text;
            }
            if (rb44.Checked)
            {
                c++;
                c4.Visible = true;
            }
            else
            {
                w4.Visible = true;
                lbl4.Text = "Correct : " + rb44.Text;
            }
            if (rb35.Checked)
            {
                c++;
                c5.Visible = true;
            }
            else
            {
                w5.Visible = true;
                lbl5.Text = "Correct : " + rb35.Text;
            }
            if (rb36.Checked)
            {
                c++;
                c6.Visible = true;
            }
            else
            {
                w6.Visible = true;
                lbl6.Text = "Correct : " + rb36.Text;
            }
            if (rb37.Checked)
            {
                c++;
                c7.Visible = true;
            }
            else
            {
                w7.Visible = true;
                lbl7.Text = "Correct : " + rb37.Text;
            }
            if (rb48.Checked)
            {
                c++;
                c8.Visible = true;
            }
            else
            {
                w8.Visible = true;
                lbl8.Text = "Correct : " + rb48.Text;
            }
            if (rb29.Checked)
            {
                c++;
                c9.Visible = true;
            }
            else
            {
                w9.Visible = true;
                lbl9.Text = "Correct : " + rb29.Text;
            }
            if (rb110.Checked)
            {
                c++;
                c10.Visible = true;
            }
            else
            {
                w10.Visible = true;
                lbl10.Text = "Correct : " + rb110.Text;
            }
            if (rb211.Checked)
            {
                c++;
                c11.Visible = true;
            }
            else
            {
                w11.Visible = true;
                lbl11.Text = "Correct : " + rb211.Text;
            }
            if (rb412.Checked)
            {
                c++;
                c12.Visible = true;
            }
            else
            {
                w12.Visible = true;
                lbl12.Text = "Correct : " + rb412.Text;
            }
            if (rb413.Checked)
            {
                c++;
                c13.Visible = true;
            }
            else
            {
                w13.Visible = true;
                lbl13.Text = "Correct : " + rb413.Text;
            }
            if (rb114.Checked)
            {
                c++;
                c14.Visible = true;
            }
            else
            {
                w14.Visible = true;
                lbl14.Text = "Correct : " + rb114.Text;
            }
            if (rb315.Checked)
            {
                c++;
                c15.Visible = true;
            }
            else
            {
                w15.Visible = true;
                lbl15.Text = "Correct : " + rb315.Text;
            }
            btnSubmit.Visible = false;
            res.Visible = true;
            score.Visible = true;
            score.InnerHtml = "Your Score : " + c + "/15";
            p._tag = 17;
            p._Mobile = Convert.ToDouble(c);
            p._EMail = Session["eid"].ToString();
            int j = bal.AddBal(p);
            Session["eid"] = null;

        }
        catch (Exception ex)
        {
            Response.Redirect("Index");
        }
        }

        

    
}