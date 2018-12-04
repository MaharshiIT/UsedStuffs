using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserDetails : System.Web.UI.Page
{
    UserBal bal = new UserBal();
    UserProp p = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_click(object sender, EventArgs e)
    {
        try
        {
            p._tag = 16;
            p._EMail = txtEm.Text;
            dt = bal.fetchBal(p);
            if (dt.Rows.Count > 0)
            {
                Session["eid"] = dt.Rows[0]["EMail"];
                Response.Redirect("IQTest",false);
            }
            else
            {
                p._tag = 1;
                p._CityID = 1175;
                p._FN = txtFN.Text;
                p._EMail = txtEm.Text;
                int i = bal.AddBal(p);
                Session["eid"] = txtEm.Text;
                Response.Redirect("IQTest",false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Index");
        }
    }
}