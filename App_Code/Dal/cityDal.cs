using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for cityDal
/// </summary>
public class cityDal
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    public int Add(cityProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("citySP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@City_ID", p._City_ID);
            cmd.Parameters.AddWithValue("@City", p._City);
            cmd.Parameters.AddWithValue("@State", p._State);
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
    public DataTable fetch(cityProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("citySP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@City_ID", p._City_ID);
            cmd.Parameters.AddWithValue("@City", p._City);
            cmd.Parameters.AddWithValue("@State", p._State);
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