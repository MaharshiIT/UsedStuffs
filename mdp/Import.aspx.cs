using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class Import : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fileName = FileUpload1.ResolveClientUrl(FileUpload1.PostedFile.FileName);
int count = 0;
SqlConnection conS = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
try
{
   DataTable dtExcel = new DataTable();
   string SourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\Maharshi\Documents\CityDB.accdb;Persist Security Info=False;";
   OleDbConnection con = new OleDbConnection(SourceConstr);
   string query = "Select * from CityTb";
   OleDbDataAdapter data = new OleDbDataAdapter(query, con);
   data.Fill(dtExcel);
   for (int i = 0; i < dtExcel.Rows.Count; i++)
   {
      try
      {
         string q = "insert into City_master(State,City) values('"+dtExcel.Rows[i]["city_state"].ToString()+"','"+dtExcel.Rows[i]["city_name"].ToString()+"')";
          SqlCommand cmd = new SqlCommand(q,conS);
          conS.Open();
          cmd.ExecuteNonQuery();
          conS.Close();
      }
      catch (Exception ex)
      {
         continue;
      }
   }
  
}
catch (Exception ex)
{
   throw ex;
}
finally
{
    conS.Close();
}
    }
}