using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ProdDal
/// </summary>
public class ProdDal
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    public int Add(ProdProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("prodSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Cat_ID", p._Cat_ID);
            cmd.Parameters.AddWithValue("@Color", p._Color);
            cmd.Parameters.AddWithValue("@Description", p._Description);
            cmd.Parameters.AddWithValue("@MfgDate", p._MfgDate);
            cmd.Parameters.AddWithValue("@Model", p._Model);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@Photo", p._Photo);
            cmd.Parameters.AddWithValue("@PostDate", p._PostDate);
            cmd.Parameters.AddWithValue("@Price", p._Price);
            cmd.Parameters.AddWithValue("@Prod_ID", p._Prod_ID);
            cmd.Parameters.AddWithValue("@Sub_ID", p._Sub_ID);
            cmd.Parameters.AddWithValue("@User_ID", p._User_ID);
            cmd.Parameters.AddWithValue("@Status", p._Status);
            return cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            con.Close();
            return 0;
        }
        finally
        {
            con.Close();
        }
    }
    public DataTable fetch(ProdProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("prodSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Cat_ID", p._Cat_ID);
            cmd.Parameters.AddWithValue("@Color", p._Color);
            cmd.Parameters.AddWithValue("@Description", p._Description);
            cmd.Parameters.AddWithValue("@MfgDate", p._MfgDate);
            cmd.Parameters.AddWithValue("@Model", p._Model);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@Photo", p._Photo);
            cmd.Parameters.AddWithValue("@PostDate", p._PostDate);
            cmd.Parameters.AddWithValue("@Price", p._Price);
            cmd.Parameters.AddWithValue("@Prod_ID", p._Prod_ID);
            cmd.Parameters.AddWithValue("@Sub_ID", p._Sub_ID);
            cmd.Parameters.AddWithValue("@User_ID", p._User_ID);
            cmd.Parameters.AddWithValue("@Status", p._Status);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        catch (Exception e)
        {
            con.Close();
            return null;
        }
        finally
        {
            con.Close();
        }

    }
}