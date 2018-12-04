using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

public partial class Index : System.Web.UI.Page
{
    CatBal bal = new CatBal();
    CatProp p = new CatProp();
    ProdBal balP = new ProdBal();
    ProdProp pP = new ProdProp();
    BanBal balB = new BanBal();
    BanProp pB = new BanProp();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            string ip = getclientIP();
            lblIP.Text = "Your IP: " + ip;
            p._tag = 2;
            dt = bal.fetchBal(p);
            if (dt.Rows.Count > 0 && dt != null)
            {
                rpt.DataSource = dt;
                rpt.DataBind();
            }
            pP._tag = 7;
            dt = balP.fetchBal(pP);
            if (dt != null && dt.Rows.Count > 0)
            {
                lblProd.Text = dt.Rows[0]["Name"].ToString();
                aName.HRef = "ProdDetails?pid=" + MailSender.base64Encode(dt.Rows[0]["Prod_ID"].ToString());
                imgProd.Src = "~/Photos/" + dt.Rows[0]["Photo"].ToString();
                aImg.HRef = "ProdDetails?pid=" + MailSender.base64Encode(dt.Rows[0]["Prod_ID"].ToString());
                lblPrice.Text = "Rs." + dt.Rows[0]["Price"].ToString();
            }
            pB._tag = 2;
            dt = balB.fetchBal(pB);
            rptBan.DataSource = dt;
            rptBan.DataBind();
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
        ((HyperLink)e.Item.FindControl("link")).NavigateUrl = "Products?sid=" + ((HiddenField)e.Item.FindControl("hid")).Value;
    }
    public static string getclientIP()
    {
        string result = string.Empty;
        string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (!string.IsNullOrEmpty(ip))
        {
            string[] ipRange = ip.Split(',');
            int le = ipRange.Length - 1;
            result = ipRange[0];
        }
        else
        {
            result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }

        return result;
    }
}