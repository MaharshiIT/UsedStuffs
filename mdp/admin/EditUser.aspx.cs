﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class mdp_admin_EditUser : System.Web.UI.Page
{
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        //ViewState["sort"] = null;
        p._tag = 2;
        dt = bal.fetchBal(p);
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "";
                gridAdmin.DataSource = dt;
                gridAdmin.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "scrpt", "<script type='text/javascript'>document.getElementById('ContentPlaceHolder1_hidCount').value='" + gridAdmin.Rows.Count + "'</script>", false);
            }
            else
            {
                lblMsg.Text = "Sorry! No records found";
                gridAdmin.DataSource = null;
                gridAdmin.DataBind();
                ViewState["data"] = null;
            }
        }
        else
            lblMsg.Text = "Error in fetching records! Please try again";
    }
    protected void btnClick(object sender, EventArgs e)
    {
        int i = Convert.ToInt16(((ImageButton)sender).CommandArgument);
        Session["idU"] = i;
        Response.Redirect("AddUser");
    }
    protected void Sort(object sender, GridViewSortEventArgs e)
    {
        p._tag = 2;
        dt = bal.fetchBal(p);
        DataView dv = dt.DefaultView;

        if (ViewState["dir"] == null)
            ViewState["dir"] = SortDirection.Ascending;
        if (e.SortDirection == (SortDirection)ViewState["dir"])
        {
            dv.Sort = e.SortExpression + " ASC";
            gridAdmin.DataSource = dv;
            gridAdmin.DataBind();
            ViewState["data"] = dv.ToTable();
            ViewState["dir"] = SortDirection.Descending;
        }
        else
        {
            dv.Sort = e.SortExpression + " DESC";
            gridAdmin.DataSource = dv;
            gridAdmin.DataBind();
            ViewState["data"] = dv.ToTable();
            ViewState["dir"] = SortDirection.Ascending;
        }
    }
    protected void Search(object sender, EventArgs e)
    {
        try
        {
            string search = "";
            if (drpSearch.SelectedItem.Text == "Name" || drpSearch.SelectedItem.Text == "EMail" || drpSearch.SelectedItem.Text == "City")
                search = drpSearch.SelectedValue + " like '%" + txtSearch.Text + "%'";
            else if (drpSearch.SelectedItem.Text == "Phone")
                search = drpSearch.SelectedValue + "=" + Convert.ToDouble(txtSearch.Text);
            else
                search = "";
            p._tag = 2;
            dt = bal.fetchBal(p);
            DataView dv = new DataView(dt);
            dv.RowFilter = search;
            if (dv.ToTable().Rows.Count > 0)
            {
                gridAdmin.DataSource = dv.ToTable();
                gridAdmin.DataBind();
                lblMsg.Text = "";
            }
            else
            {
                lblMsg.Text = "Sorry! No records found";
                gridAdmin.DataSource = null;
                gridAdmin.DataBind();
                ViewState["data"] = null;
            }
        }
        catch (Exception e1)
        {
            lblMsg.Text = "Sorry! No records found";
            gridAdmin.DataSource = null;
            gridAdmin.DataBind();
            ViewState["data"] = null;
        }

    }
    protected void pageChange(object sender, GridViewPageEventArgs e)
    {
        gridAdmin.PageIndex = e.NewPageIndex;
        if (ViewState["data"] != null)
        {
            gridAdmin.DataSource = ViewState["data"];
            gridAdmin.DataBind();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "scrpt", "<script type='text/javascript'>document.getElementById('ContentPlaceHolder1_hidCount').value='" + gridAdmin.Rows.Count + "'</script>", false);
        }
        else
        {
            bind();
            ViewState["data"] = null;
        }
    }
    protected void Delete(object sender, EventArgs e)
    {
        int er=0;
        foreach (GridViewRow row in gridAdmin.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chk");
            if (cb.Checked)
            {
                int id = Convert.ToInt16(((HiddenField)row.FindControl("hdnID")).Value);
                p._tag = 3;
                p._ID = id;
                int j = bal.AddBal(p);
                if (j == 0)
                {
                    er = 1;
                    break;
                }

            }
        }
        if (er == 1)
        {
            lblMsg.Text = "Error in deletion";
            bind();
        }
        else
        {
            lblMsg.Text = "Record(s) deleted successfully";
            bind();
        }

    }
}