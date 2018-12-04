using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BanDal
/// </summary>
public class BanDal
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    public int Add(BanProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("bannerSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Banner_ID", p._Banner_ID);
            cmd.Parameters.AddWithValue("@Pos", p._Pos);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@Link", p._Link);
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
    public DataTable fetch(BanProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("bannerSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Banner_ID", p._Banner_ID);
            cmd.Parameters.AddWithValue("@Pos", p._Pos);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@Link", p._Link);
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