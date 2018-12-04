using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Products : System.Web.UI.Page
{
    CatBal bal = new CatBal();
    CatProp p = new CatProp();
    ProdBal balP = new ProdBal();
    ProdProp pP = new ProdProp();
    cityBal balC = new cityBal();
    cityProp pC = new cityProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            p._tag = 2;
            dt = bal.fetchBal(p);
            if (dt.Rows.Count > 0 && dt != null)
            {
                drpCat.DataSource = dt;
                drpCat.DataTextField = "Name";
                drpCat.DataValueField = "Cat_ID";
                drpCat.DataBind();
                rpt.DataSource = dt;
                rpt.DataBind();
               
            }
            //pP._tag = 7;
            //dt = balP.fetchBal(pP);
            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    lblProd.Text = dt.Rows[0]["Name"].ToString();
            //    aName.HRef = "ProdDetails?pid=" + MailSender.base64Encode(dt.Rows[0]["Prod_ID"].ToString());
            //    imgProd.Src = "~/Photos/" + dt.Rows[0]["Photo"].ToString();
            //    aImg.HRef = "ProdDetails?pid=" + MailSender.base64Encode(dt.Rows[0]["Prod_ID"].ToString());
            //    lblPrice.Text = "Rs." + dt.Rows[0]["Price"].ToString();
            //}
            bind();
            
           
        }
    }
    protected void Search(object sender, EventArgs e)
    {
        try
        {
            string search = "";
            if (chk.Checked)
            {
                if (drpSearch.SelectedItem.Text == "Name" || drpSearch.SelectedItem.Text == "Model" || drpSearch.SelectedItem.Text == "State" || drpSearch.SelectedItem.Text == "City")
                    search = drpSearch.SelectedValue + " like '%" + txtSearch.Text + "%'" + " and " + "Price" + ">=" + Convert.ToDouble(txtFrom.Text) + " and " + "Price" + "<=" + Convert.ToDouble(txtTo.Text);
                else if (drpSearch.SelectedItem.Text == "Category")
                    search = drpSearch.SelectedValue + "='" + drpCat.SelectedItem.Text + "'" + " and " + "Price" + ">=" + Convert.ToDouble(txtFrom.Text) + " and " + "Price" + "<=" + Convert.ToDouble(txtTo.Text);
                else
                {
                    if (txtFrom.Text != "" && txtTo.Text != "")
                        search = "Price" + ">=" + Convert.ToDouble(txtFrom.Text) + " and " + "Price" + "<=" + Convert.ToDouble(txtTo.Text);
                    else
                        search = "";
                }
            }
            else
            {
                if (drpSearch.SelectedItem.Text == "Name" || drpSearch.SelectedItem.Text == "Model" || drpSearch.SelectedItem.Text == "State" || drpSearch.SelectedItem.Text == "City")
                    search = drpSearch.SelectedValue + " like '%" + txtSearch.Text + "%'";
                else if (drpSearch.SelectedItem.Text == "Category")
                    search = drpSearch.SelectedValue + "='" + drpCat.SelectedItem.Text + "'";
                else
                search = "";
            }
            pP._tag = 5;
            dt = balP.fetchBal(pP);
            DataView dv = new DataView(dt);
            dv.RowFilter = search;
            if (dv.ToTable().Rows.Count > 0)
            {

                lblMsg.Text = "";
                rptProd.DataSource = dv.ToTable();
                rptProd.DataBind();
                PagedDataSource pgitems = new PagedDataSource();
                pgitems.DataSource = dv;
                pgitems.AllowPaging = true;
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = 0;
                lblPage.Text = "Page " + (pgitems.CurrentPageIndex + 1) + " of " + pgitems.PageCount;
                if (pgitems.PageCount > 1)
                {
                    rptPaging1.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i < pgitems.PageCount; i++)
                        pages.Add((i + 1).ToString());
                    rptPaging1.DataSource = pages;
                    rptPaging1.DataBind();
                }
                else
                {
                    rptPaging1.Visible = false;
                }
                rptProd.DataSource = pgitems;
                rptProd.DataBind();
                ViewState["search"] = dv.ToTable();
            }
            else
            {
                ViewState["search"] = null;
                rptProd.DataSource = null;
                rptProd.DataBind();
                rptPaging1.Visible = false;
                lblMsg.Text = "Sorry! No products found in this search criteria";
                lblPage.Text = "";
            }
            drpSearch.SelectedIndex = 0;
            txtFrom.Text = "";
            txtTo.Text = "";
            chk.Checked = false;
        }
        catch (Exception e1)
        {
            rptProd.DataSource = null;
            rptProd.DataBind();
            rptPaging1.Visible = false;
            ViewState["search"] = null;
            lblMsg.Text = "Sorry! No products found in this search criteria";
            drpSearch.SelectedIndex = 0;
            lblPage.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            chk.Checked = false;
        }

    }
    public void bind()
    {
        ViewState["search"] = null;
        try
        {
            if (Request.QueryString["sid"] != null)
            {
                pP._tag = 8;
                pP._Sub_ID = Convert.ToInt16(MailSender.base64Decode(Request.QueryString["sid"].ToString()));
                dt = balP.fetchBal(pP);
                if (dt.Rows.Count > 0 && dt != null)
                {
                    lblMsg.Text = "";
                    rptProd.DataSource = dt;
                    rptProd.DataBind();
                }
                else
                {
                    lblMsg.Text = "Sorry! No products found in this subcategory";
                    lblPage.Text = "";
                    return;
                }
            }
            else
            {
                pP._tag = 10;
                dt = balP.fetchBal(pP);
                if (dt.Rows.Count > 0 && dt != null)
                {
                    lblMsg.Text = "";
                    rptProd.DataSource = dt;
                    rptProd.DataBind();
                }
                else
                {
                    lblMsg.Text = "Sorry! No products found in this subcategory";
                    lblPage.Text = "";
                    return;
                }
            }
            PagedDataSource pgitems = new PagedDataSource();
            DataView dv = new DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            lblPage.Text = "Page " + (pgitems.CurrentPageIndex + 1) + " of " + pgitems.PageCount;
            if (pgitems.PageCount > 1)
            {
                rptPaging1.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPaging1.DataSource = pages;
                rptPaging1.DataBind();
            }
            else
            {
                rptPaging1.Visible = false;
            }
            rptProd.DataSource = pgitems;
            rptProd.DataBind();
        }
        catch (Exception ex)
        {
            Response.Redirect("Products");
        }
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (ViewState["search"] == null)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            bind();
            
        }
        else
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            PagedDataSource pgitems = new PagedDataSource();
            DataView dv = new DataView((DataTable)ViewState["search"]);
            if (dv.ToTable().Rows.Count > 0)
            {
                pgitems.DataSource = dv;
                pgitems.AllowPaging = true;
                pgitems.PageSize = 12;
                pgitems.CurrentPageIndex = PageNumber;
                lblPage.Text = "Page " + (pgitems.CurrentPageIndex + 1) + " of " + pgitems.PageCount;
                if (pgitems.PageCount > 1)
                {
                    rptPaging1.Visible = true;
                    ArrayList pages = new ArrayList();
                    for (int i = 0; i < pgitems.PageCount; i++)
                        pages.Add((i + 1).ToString());
                    rptPaging1.DataSource = pages;
                    rptPaging1.DataBind();
                }
                else
                {
                    rptPaging1.Visible = false;
                }
                rptProd.DataSource = pgitems;
                rptProd.DataBind();
            }
            else
            {
                ViewState["search"] = null;
                rptProd.DataSource = null;
                rptProd.DataBind();
                rptPaging1.Visible = false;
                lblMsg.Text = "Sorry! No products found in this search criteria";
                lblPage.Text = "";
            }
        }
    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    protected void rptBound(object sender, RepeaterItemEventArgs e)
    {

        p._tag = 8;
        p._Cat_ID = Convert.ToInt16(((HiddenField)e.Item.FindControl("hid")).Value);
        dt = bal.fetchBal(p);
        ((Repeater)e.Item.FindControl("rptSub")).DataSource = dt;
        ((Repeater)e.Item.FindControl("rptSub")).DataBind();

    }
    protected void bound(object sender, RepeaterItemEventArgs e)
    {
        ((HiddenField)e.Item.FindControl("hid")).Value = MailSender.base64Encode(((HiddenField)e.Item.FindControl("hid")).Value);
        ((HyperLink)e.Item.FindControl("lnkDetail1")).NavigateUrl = "ProdDetails?pid=" + ((HiddenField)e.Item.FindControl("hid")).Value;
        ((HyperLink)e.Item.FindControl("lnkBox1")).NavigateUrl = "ProdDetails?pid=" + ((HiddenField)e.Item.FindControl("hid")).Value;
    }
    protected void bound1(object sender, RepeaterItemEventArgs e)
    {
        ((HiddenField)e.Item.FindControl("hid")).Value = MailSender.base64Encode(((HiddenField)e.Item.FindControl("hid")).Value);
        ((HyperLink)e.Item.FindControl("link")).NavigateUrl = "Products?sid=" + ((HiddenField)e.Item.FindControl("hid")).Value;
    }

    
}