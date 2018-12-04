using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class mdp_admin_AddCity : System.Web.UI.Page
{
    cityBal bal = new cityBal();
    cityProp p = new cityProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
            {
                p._tag = 2;
                dt = bal.fetchBal(p);
                drpCat.DataSource = dt;
                drpCat.DataTextField = "State";
                drpCat.DataBind();
                ListItem li = new ListItem("--Please select--", "0");
                drpCat.Items.Insert(0, li);
                if (Session["idCity"] != null)
                {
                    ViewState["idSub"] = Session["idCity"];
                    Session.Remove("idCity");
                    p._tag = 4;
                    p._City_ID = Convert.ToInt16(ViewState["idSub"]);
                    dt = bal.fetchBal(p);
                    drpCat.SelectedIndex = drpCat.Items.IndexOf(drpCat.Items.FindByText(dt.Rows[0]["State"].ToString()));
                    txtFN.Text = dt.Rows[0]["City"].ToString();
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["idSub"] == null)
        {
            p._tag = 7;
            dt = bal.fetchBal(p);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow[] dr = dt.Select("City='" + txtFN.Text.Trim() + "' and State='"+drpCat.SelectedItem.Text+"'");
                if (dr.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate City found! Please try again';</script>", false);
                    return;
                }
            }
            p._tag = 1;
            p._City = txtFN.Text;
            p._State = drpCat.SelectedItem.Text;
            int i = bal.AddBal(p);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Record inserted successfully...';</script>", false);
                txtFN.Text = "";
                drpCat.SelectedIndex = 0;
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in insertion';</script>", false);

        }
        else
        {
            p._tag = 7;
            dt = bal.fetchBal(p);
            DataRow[] dr = dt.Select("City='" + txtFN.Text.Trim() + "' and State='" + drpCat.SelectedItem.Text + "' and City_ID<>" + Convert.ToInt16(ViewState["idSub"]) + "");
            if (dr.Length > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate City found! Please try again';</script>", false);
                return;
            }
            p._tag = 5;
            p._City_ID = Convert.ToInt16(ViewState["idSub"]);
            p._City = txtFN.Text;
            p._State = drpCat.SelectedItem.Text;
            int i = bal.AddBal(p);
            if (i != 0)
            {
                Response.Redirect("EditSubCat");
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in updation';</script>", false);
        }
    }
}