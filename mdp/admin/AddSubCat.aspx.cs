using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class mdp_admin_AddSubCat : System.Web.UI.Page
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
                p._tag = 2;
                dt = bal.fetchBal(p);
                drpCat.DataSource = dt;
                drpCat.DataTextField = "Name";
                drpCat.DataValueField = "Cat_ID";
                drpCat.DataBind();
                ListItem li = new ListItem("--Please select--", "0");
                drpCat.Items.Insert(0, li);
                if (Session["idSub"] != null)
                {
                    ViewState["idSub"] = Session["idSub"];
                    Session.Remove("idSub");
                    p._tag = 7;
                    p._Sub_ID = Convert.ToInt16(ViewState["idSub"]);
                    dt = bal.fetchBal(p);
                    drpCat.SelectedIndex = drpCat.Items.IndexOf(drpCat.Items.FindByValue(dt.Rows[0]["Cat_ID"].ToString()));
                    txtFN.Text = dt.Rows[0]["SubName"].ToString();
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["idSub"] == null)
        {
            p._tag = 12;
            dt = bal.fetchBal(p);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow[] dr = dt.Select("SubName='" + txtFN.Text.Trim() + "' and Name='"+drpCat.SelectedItem.Text+"'");
                if (dr.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Subcategory found! Please try again';</script>", false);
                    return;
                }
            }
            p._tag = 5;
            p._SubName = txtFN.Text;
            p._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
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
            p._tag = 12;
            dt = bal.fetchBal(p);
            DataRow[] dr = dt.Select("SubName='" + txtFN.Text.Trim() + "' and Name='" + drpCat.SelectedItem.Text + "' and Sub_ID<>" + Convert.ToInt16(ViewState["idSub"]) + "");
            if (dr.Length > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate Subcategory found! Please try again';</script>", false);
                return;
            }
            p._tag = 9;
            p._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
            p._SubName= txtFN.Text;
            p._Sub_ID = Convert.ToInt16(ViewState["idSub"]);
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