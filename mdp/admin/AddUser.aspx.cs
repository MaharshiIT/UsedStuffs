using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class mdp_admin_AddUser : System.Web.UI.Page
{
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    cityBal balC = new cityBal();
    cityProp pC = new cityProp();
    DataTable dt = new DataTable();
    DataTable dtC = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
            {
                pC._tag = 2;
                dt = balC.fetchBal(pC);
                drpState.DataSource = dt;
                drpState.DataTextField = "State";
                drpState.DataBind();
                drpCity.Items.Insert(0, "--Please select--");
                drpState.Items.Insert(0, "--Please select--");
                if (Session["idU"] != null)
                {
                    p._tag = 5;
                    p._ID = Convert.ToInt16(Session["idU"]);
                    dt = bal.fetchBal(p);
                    if (dt != null)
                    {
                        txtAddr.Text = dt.Rows[0]["Address"].ToString();
                        txtEm.Text = dt.Rows[0]["EMail"].ToString();
                        txtFN.Text = dt.Rows[0]["FN"].ToString();
                        txtLN.Text = dt.Rows[0]["LN"].ToString();
                        txtMob.Text = dt.Rows[0]["Mobile"].ToString();
                        pC._tag = 4;
                        pC._City_ID = Convert.ToInt16(dt.Rows[0]["City_ID"]);
                        dtC = balC.fetchBal(pC);
                        drpState.SelectedIndex = drpState.Items.IndexOf(drpState.Items.FindByText(dtC.Rows[0]["State"].ToString()));
                        pC._tag = 3;
                        pC._State = drpState.SelectedItem.Text;
                        DataTable dtP = new DataTable();
                        dtP = balC.fetchBal(pC);
                        drpCity.DataSource = dtP;
                        drpCity.DataTextField = "City";
                        drpCity.DataBind();
                        drpCity.SelectedIndex = drpCity.Items.IndexOf(drpCity.Items.FindByText(dtC.Rows[0]["City"].ToString()));
                        txtUser.Text = dt.Rows[0]["Username"].ToString();
                        if (dt.Rows[0]["Gender"].ToString() == "Male")
                            rbMale.Checked = true;
                        else
                            rbFemale.Checked = true;
                        ViewState["id"] = Session["idU"];
                        Session.Remove("idU");
                        sPass.Visible = false;
                        stxtPass.Visible = false;
                        sNPass.Visible = true;
                        sNtxtPass.Visible = true;

                    }
                }
            }
            else
                Response.Redirect("Login");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["id"] != null)
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            if (dt != null)
            {
                DataRow[] dr = dt.Select("Username='" + txtUser.Text + "' and User_ID<>" + Convert.ToInt16(ViewState["id"]) + "");
                if (dr.Length > 0)
                {

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Username found! Please try again';</script>", false);
                    return;
                }
                DataRow[] dr1 = dt.Select("EMail='" + txtEm.Text + "' and User_ID<>" + Convert.ToInt16(ViewState["id"]) + "");
                if (dr1.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script2", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate EMail ID found! Please try again';</script>", false);
                    return;
                }
            }

            p._Address = txtAddr.Text;
            pC._tag = 6;
            pC._City = drpCity.SelectedItem.Text;
            pC._State = drpState.SelectedItem.Text;
            dtC = balC.fetchBal(pC);
            p._CityID = Convert.ToInt16(dtC.Rows[0][0]);
            p._EMail = txtEm.Text;
            p._EditID = Convert.ToInt16(Session["Admin_id"]);
            if (rbMale.Checked)
                p._Gender = "Male";
            else
                p._Gender = "Female";
            p._Mobile = Convert.ToDouble(txtMob.Text);
            p._FN = txtFN.Text;
            p._LN = txtLN.Text;
            if (txtNewPass.Text != "")
                p._Password = MailSender.base64Encode(txtNewPass.Text);
            p._tag = 4;
            p._ID = Convert.ToInt16(ViewState["id"]);
            p._Username = txtUser.Text;
            
            int i = bal.AddBal(p);
            if (i != 0)
            {
                Response.Redirect("EditUser");
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script4", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in updation! Please try again';</script>", false);
        }
        else
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            if (dt != null)
            {
                DataRow[] dr = dt.Select("Username='" + txtUser.Text + "'");
                if (dr.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Username found! Please try again';</script>", false);
                    return;
                }
                DataRow[] dr1 = dt.Select("EMail='" + txtEm.Text + "'");
                if (dr1.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script2", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate EMail ID found! Please try again';</script>", false);
                    return;
                }
            }
            p._Address = txtAddr.Text;
            pC._tag = 6;
            pC._City = drpCity.SelectedItem.Text;
            pC._State = drpState.SelectedItem.Text;
            dtC = balC.fetchBal(pC);
            p._CityID = Convert.ToInt16(dtC.Rows[0][0]);
            p._EMail = txtEm.Text;
            p._AddID = Convert.ToInt16(Session["Admin_id"]);
            p._CrDate = DateTime.Now;
            if (rbMale.Checked)
                p._Gender = "Male";
            else
                p._Gender = "Female";
            p._Mobile = Convert.ToDouble(txtMob.Text);
            p._FN = txtFN.Text;
            p._LN = txtLN.Text;
            p._Password = MailSender.base64Encode(txtPass.Text);
            p._tag = 1;
            p._Username = txtUser.Text;
            int i = bal.AddBal(p);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script3", "<script type='text/javascript'>document.getElementById('val').innerHTML='Record inserted successfully...';</script>", false);
                clearAll();
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script4", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in insertion! Please try again';</script>", false);

        }
    }
    public void clearAll()
    {
        txtAddr.Text = "";
        //txtCity.Text = "";
        txtEm.Text = "";
        txtFN.Text = "";
        txtLN.Text = "";
        txtMob.Text = "";
        txtPass.Text = "";
        //txtState.Text = "";
        txtUser.Text = "";
        rbFemale.Checked = false;
        rbMale.Checked = false;
        drpCity.SelectedIndex = 0;
        drpCity.SelectedIndex = 0;
    }
    protected void StateChange(object sender, EventArgs e)
    {
        pC._tag = 3;
        pC._State = drpState.SelectedItem.Text;
        dt = balC.fetchBal(pC);
        if (dt != null && dt.Rows.Count > 0)
        {
            drpCity.DataSource = dt;
            drpCity.DataTextField = "City";
            drpCity.DataBind();
        }


    }
}