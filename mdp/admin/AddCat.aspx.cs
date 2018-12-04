using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class mdp_admin_AddCat : System.Web.UI.Page
{
    CatBal bal = new CatBal();
    CatProp p = new CatProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
            {
                if (Session["idC"] != null)
                {
                    ViewState["idC"] = Session["idC"];
                    Session.Remove("idC");
                    p._tag = 3;
                    p._Cat_ID = Convert.ToInt16(ViewState["idC"]);
                    dt = bal.fetchBal(p);
                    txtFN.Text = dt.Rows[0]["Name"].ToString();
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["idC"] == null)
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow[] dr = dt.Select("Name='" + txtFN.Text.Trim() + "'");
                if (dr.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Category found! Please try again';</script>", false);
                    return;
                }
            }
            p._tag = 1;
            p._Name = txtFN.Text;
            int i = bal.AddBal(p);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Record inserted successfully...';</script>", false);
                txtFN.Text = "";
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in insertion';</script>", false);

        }
        else
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            DataRow[] dr = dt.Select("Name='" + txtFN.Text.Trim() + "' and Cat_ID<>"+Convert.ToInt16(ViewState["idC"])+"");
            if (dr.Length > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Category found! Please try again';</script>", false);
                return;
            }
            p._tag = 4;
            p._Name = txtFN.Text;
            p._Cat_ID = Convert.ToInt16(ViewState["idC"]);
            int i = bal.AddBal(p);
            if (i != 0)
            {
                Response.Redirect("EditCat");
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in updation';</script>", false);
        }
    }
}