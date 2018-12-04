using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Account : System.Web.UI.Page
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
        if (Session["User_id"] != null)
        {
            bind();
        }
        else
            Response.Redirect("Login");
    }
    public void bind()
    {
        
        try
        {
            
                pP._tag = 9;
                pP._User_ID = Convert.ToInt16(Session["User_id"]);
                dt = balP.fetchBal(pP);
                if (dt.Rows.Count > 0 && dt != null)
                {
                    lblMsg.Text = "";
                    rptProd.DataSource = dt;
                    rptProd.DataBind();
                }
                else
                {
                    lblMsg.Text = "You haven't posted any product yet!";
                    lblPage.Text = "";
                    return;
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
    protected void edit_click(object sender, EventArgs e)
    {
        Session["idProd"] = ((LinkButton)sender).CommandArgument;
        Response.Redirect("PostProd");
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            bind();
       
    }
    protected void up_click(object sender, EventArgs e)
    {
        Session["idUser"] = Session["User_id"];
        Response.Redirect("Signup");
    }
}