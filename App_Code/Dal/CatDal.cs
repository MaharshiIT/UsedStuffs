using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for CatDal
/// </summary>
public class CatDal
{
	SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    public int Add(CatProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("catSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Cat_ID", p._Cat_ID);
            cmd.Parameters.AddWithValue("@Sub_ID", p._Sub_ID);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@SubName", p._SubName);
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
    public DataTable fetch(CatProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("catSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Cat_ID", p._Cat_ID);
            cmd.Parameters.AddWithValue("@Sub_ID", p._Sub_ID);
            cmd.Parameters.AddWithValue("@Name", p._Name);
            cmd.Parameters.AddWithValue("@SubName", p._SubName);
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