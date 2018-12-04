using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class mdp_admin_AddProduct : System.Web.UI.Page
{
    ProdBal bal = new ProdBal();
    ProdProp p = new ProdProp();
    CatBal Cbal = new CatBal();
    CatProp Cp = new CatProp();
    UserBal Ubal = new UserBal();
    UserProp Up = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
            {
                Cp._tag = 2;
                dt = Cbal.fetchBal(Cp);
                drpCat.DataSource = dt;
                drpCat.DataTextField = "Name";
                drpCat.DataValueField = "Cat_ID";
                drpCat.DataBind();
                ListItem li = new ListItem("--Please select--","0");
                drpCat.Items.Insert(0,li);
                ListItem li1 = new ListItem("--Please select--", "0");
                drpSub.Items.Insert(0, li1);
                if (Session["idProd"] != null)
                {
                    ViewState["id"] = Session["idProd"];
                    Session.Remove("idProd");
                    p._tag = 3;
                    p._Prod_ID = Convert.ToInt16(ViewState["id"]);
                    dt = bal.fetchBal(p);
                    drpCat.SelectedIndex = drpCat.Items.IndexOf(drpCat.Items.FindByValue(dt.Rows[0]["Cat_ID"].ToString()));
                    Cp._tag = 8;
                    Cp._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
                    DataTable dtC = new DataTable();
                    dtC = Cbal.fetchBal(Cp);
                    drpSub.DataSource = dtC;
                    drpSub.DataTextField = "SubName";
                    drpSub.DataValueField = "Sub_ID";
                    drpSub.DataBind();
                    drpSub.SelectedIndex = drpSub.Items.IndexOf(drpSub.Items.FindByValue(dt.Rows[0]["Sub_ID"].ToString()));
                    Up._tag = 5;
                    Up._ID = Convert.ToInt16(dt.Rows[0]["User_ID"]);
                    dtC = Ubal.fetchBal(Up);
                    txtUser.Text = dtC.Rows[0]["FN"].ToString() + " " + dtC.Rows[0]["LN"].ToString();
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtModel.Text = dt.Rows[0]["Model"].ToString();
                    if (dt.Rows[0]["MfgDate"].ToString()!="")
                    txtYear.Text = dt.Rows[0]["MfgDate"].ToString();

                    if (dt.Rows[0]["Color"].ToString() != "")
                        txtColor.Text = dt.Rows[0]["Color"].ToString();
                    txtPrice.Text = dt.Rows[0]["Price"].ToString();
                    imgBan.Visible = true;
                    imgBan.ImageUrl = "~/Photos/" + dt.Rows[0]["Photo"].ToString();
                    ViewState["image"] = dt.Rows[0]["Photo"].ToString();
                    if(dt.Rows[0]["Description"].ToString()!="")
                    txtDesc.Text = dt.Rows[0]["Description"].ToString();
                    if (dt.Rows[0]["Status"].ToString() == "Sold")
                        rbS.Checked = true;
                    else
                        rbU.Checked = true;

                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string fn = "";
        if (ViewState["id"] == null)
        {

            if (fp.HasFile)
            {
                FileInfo fi = new FileInfo(Server.MapPath("~/Photos/") + fp.FileName);
                if (fi.Exists)
                {
                    int ind = fi.Name.IndexOf(fi.Extension);
                    string f = fi.Name.Substring(0, ind - 1);
                    Random r = new Random();
                    fn = f + r.Next().ToString() + fi.Extension;
                }
                else
                    fn = fp.FileName;
            }
            else
                fn = "noimg.jpg";
            p._tag = 1;
            p._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
            p._Color = txtColor.Text;
            p._Description = txtDesc.Text;
            p._MfgDate = txtYear.Text;
            p._Model = txtModel.Text;
            p._Name = txtName.Text;
            p._Photo = fn;
            p._Price = Convert.ToDouble(txtPrice.Text);
            p._Sub_ID = Convert.ToInt16(drpSub.SelectedValue);
            p._User_ID = Convert.ToInt16(Session["Admin_id"]);
            if (rbS.Checked)
                p._Status = "Sold";
            else
                p._Status = "Unsold";
            int i = bal.AddBal(p);
            if (i != 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Record inserted successfully...';</script>", false);
                if (fn != "noimg.jpg")
                fp.SaveAs(Server.MapPath("~/Photos/") + fn);
                clearAll();

            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in insertion';</script>", false);

        }
        else
        {
            if (fp.HasFile)
            {
                FileInfo fi = new FileInfo(Server.MapPath("~/Photos/") + fp.FileName);
                if (fi.Exists)
                {
                    int ind = fi.Name.IndexOf(fi.Extension);
                    string f = fi.Name.Substring(0, ind - 1);
                    Random r = new Random();
                    fn = f + r.Next().ToString() + fi.Extension;
                }
                else
                    fn = fp.FileName;
            }
            else
                fn = ViewState["image"].ToString();
            p._tag = 4;
            p._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
            p._Color = txtColor.Text;
            p._Description = txtDesc.Text;
            p._MfgDate = txtYear.Text;
            p._Model = txtModel.Text;
            p._Name = txtName.Text;
            p._Photo = fn;
            p._Price = Convert.ToDouble(txtPrice.Text);
            p._Sub_ID = Convert.ToInt16(drpSub.SelectedValue);
            if (rbS.Checked)
                p._Status = "Sold";
            else
                p._Status = "Unsold";
            p._Prod_ID = Convert.ToInt16(ViewState["id"]);
            int i = bal.AddBal(p);
            if (i != 0)
            {
                if (fp.HasFile)
                {
                    FileInfo fi1 = new FileInfo(Server.MapPath("~/Photos/") + ViewState["image"].ToString());
                    if (fi1.Name != "noimg.jpg")
                    fi1.Delete();
                    fp.SaveAs(Server.MapPath("~/Photos/") + fn);
                }
                Response.Redirect("EditProduct");

            }
            else
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script1", "<script type='text/javascript'>document.getElementById('val').innerHTML='Error in updation';</script>", false);
        }
    }
    protected void drpChange(object sender, EventArgs e)
    {
        Cp._tag = 8;
        Cp._Cat_ID = Convert.ToInt16(drpCat.SelectedValue);
        dt = Cbal.fetchBal(Cp);
        drpSub.DataSource = dt;
        drpSub.DataTextField = "SubName";
        drpSub.DataValueField = "Sub_ID";
        drpSub.DataBind();
        
    }
    public void clearAll()
    {
        txtColor.Text = "";
        txtDesc.Text = "";
        txtModel.Text = "";
        txtName.Text = "";
        txtPrice.Text = "";
        txtUser.Text = "";
        txtYear.Text = "";
        drpCat.SelectedIndex = 0;
        drpSub.SelectedIndex = 0;
    }
}