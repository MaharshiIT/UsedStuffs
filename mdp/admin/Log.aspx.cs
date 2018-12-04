using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class mdp_admin_Log : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin_id"] != null)
                bind();
            else
                Response.Redirect("Login");
        }
    }
    protected void bind()
    {
        string q = "select * from Userlog_master order by DateTime DESC";
        SqlCommand cmd = new SqlCommand(q, con);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gridAdmin.DataSource = dt;
        gridAdmin.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "scrpt", "<script type='text/javascript'>document.getElementById('ContentPlaceHolder1_hidCount').value='" + gridAdmin.Rows.Count + "'</script>", false);
        con.Close();
    }
    protected void Delete(object sender, EventArgs e)
    {
        int er = 0;
        foreach (GridViewRow row in gridAdmin.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chk");
            if (cb.Checked)
            {
                int id = Convert.ToInt16(((HiddenField)row.FindControl("hdnID")).Value);
                string q1 = "delete from Userlog_master where Log_ID=" + id + "";
                SqlCommand cmd1 = new SqlCommand(q1, con);
                con.Open();
                int j = cmd1.ExecuteNonQuery();
                con.Close();
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
    protected void pageChange(object sender, GridViewPageEventArgs e)
    {
        gridAdmin.PageIndex = e.NewPageIndex;
            bind();
        
    }
}