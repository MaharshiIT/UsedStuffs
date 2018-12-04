using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class mdp_admin_AddBanner : System.Web.UI.Page
{
    BanBal bal = new BanBal();
    BanProp p = new BanProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
            {
               
                if (Session["idBan"] != null)
                {
                    hid.Value = "1";
                    ViewState["id"] = Session["idBan"];
                    Session.Remove("idBan");
                    p._tag = 3;
                    p._Banner_ID = Convert.ToInt16(ViewState["id"]);
                    dt = bal.fetchBal(p);
                    drpPos.SelectedIndex = drpPos.Items.IndexOf(drpPos.Items.FindByValue(dt.Rows[0]["Pos"].ToString()));
                    if (dt.Rows[0]["Link"].ToString() != "")
                        txtFN.Text = dt.Rows[0]["Link"].ToString();
                    txtFN.Text = dt.Rows[0]["Link"].ToString();
                    imgBan.Visible=true;
                    imgBan.ImageUrl = "~/banners/" + dt.Rows[0]["Name"].ToString();
                    ViewState["image"] = dt.Rows[0]["Name"].ToString();
                    
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ViewState["id"] == null)
        {
            FileInfo fi = new FileInfo(Server.MapPath("~/banners/"+fp.FileName));
            if (fi.Exists)
            {
                  
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate banner found';</script>", false);
                return;
            }
            p._tag = 1;
            if(txtFN.Text!="")
            p._Link = txtFN.Text;
            p._Pos = Convert.ToInt16(drpPos.SelectedValue);
            p._Name = fp.FileName;
            int i = bal.AddBal(p);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Record inserted successfully...';</script>", false);
                fp.SaveAs(Server.MapPath("~/banners/"+fp.FileName));
                txtFN.Text = "";
                drpPos.SelectedIndex = 0;
                
            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in insertion';</script>", false);

        }
        else
        {
            if (fp.HasFile)
            {
                FileInfo fi = new FileInfo(Server.MapPath("~/banners/" + fp.FileName));
                if (fi.Exists)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Duplicate banner found';</script>", false);
                    return;
                }
            }
            p._tag = 4;
            if (txtFN.Text != "")
                p._Link = txtFN.Text;
            p._Pos = Convert.ToInt16(drpPos.SelectedValue);
            if (fp.HasFile)
                p._Name = fp.FileName;
            else
                p._Name = ViewState["image"].ToString();
            p._Banner_ID = Convert.ToInt16(ViewState["id"]);
            int i = bal.AddBal(p);
            if (i != 0)
            {
                if (fp.HasFile)
                {
                    FileInfo fi1 = new FileInfo(Server.MapPath("~/banners/"+ViewState["image"].ToString()));
                    fi1.Delete();
                    fp.SaveAs(Server.MapPath("~/banners/" + fp.FileName));
                }
                Response.Redirect("EditBanner");

            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in updation';</script>", false);
        }
    }
}