using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ProdDetails : System.Web.UI.Page
{
    ProdBal bal = new ProdBal();
    ProdProp p = new ProdProp();
    UserBal balU = new UserBal();
    UserProp pU = new UserProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                if (Request.QueryString["pid"] != null)
                {
                    p._tag = 3;
                    p._Prod_ID = Convert.ToInt16(MailSender.base64Decode(Request.QueryString["pid"].ToString()));
                    dt = bal.fetchBal(p);
                    img_01.Src = "~/Photos/" + dt.Rows[0]["Photo"].ToString();
                    if (dt.Rows[0]["Color"].ToString() != "")
                        lblColor.Text = dt.Rows[0]["Color"].ToString();
                    else
                        lblColor.Text = "-NA-";
                    if (dt.Rows[0]["MfgDate"].ToString() != "")
                        lblDate.Text = dt.Rows[0]["MfgDate"].ToString();
                    else
                        lblDate.Text = "-NA-";
                    lblModel.Text = dt.Rows[0]["Model"].ToString();
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                    lblPost.Text = dt.Rows[0]["PostDate"].ToString();
                    lblPrice.Text = dt.Rows[0]["Price"].ToString();
                    if (dt.Rows[0]["Description"].ToString() != "")
                        lblSpec.Text = dt.Rows[0]["Description"].ToString();
                    else
                        lblSpec.Text = "-NA-";
                    pU._tag = 9;
                    pU._ID = Convert.ToInt16(dt.Rows[0]["User_ID"]);
                    dt = balU.fetchBal(pU);
                    lblOwn.Text = dt.Rows[0]["Name"].ToString();
                    lblAdd.Text = dt.Rows[0]["Address"].ToString() + ", " + dt.Rows[0]["City"].ToString() + ", " + dt.Rows[0]["State"].ToString() + ".";
                    lblContact.Text = dt.Rows[0]["Mobile"].ToString();
                    lblmail.Text = dt.Rows[0]["EMail"].ToString();
                   

                }
                else
                    Response.Redirect("Products");
            }
            catch (Exception ex)
            {
                Response.Redirect("Products");
            }
        }
    }

}