using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserDal
/// </summary>
public class UserDal
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
    public int Add(UserProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Address", p._Address);
            cmd.Parameters.AddWithValue("@City_ID", p._CityID);
            cmd.Parameters.AddWithValue("@EMail", p._EMail);
            cmd.Parameters.AddWithValue("@Gender", p._Gender);
            cmd.Parameters.AddWithValue("@Mobile", p._Mobile);
            cmd.Parameters.AddWithValue("@FN", p._FN);
            cmd.Parameters.AddWithValue("@LN", p._LN);
            cmd.Parameters.AddWithValue("@Password", p._Password);
            cmd.Parameters.AddWithValue("@Username", p._Username);
            cmd.Parameters.AddWithValue("@ID", p._ID);
            cmd.Parameters.AddWithValue("@AddID", p._AddID);
            cmd.Parameters.AddWithValue("@EditID", p._EditID);
            cmd.Parameters.AddWithValue("@CrDate", p._CrDate);
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
    public DataTable fetch(UserProp p)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("userSP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tag", p._tag);
            cmd.Parameters.AddWithValue("@Address", p._Address);
            cmd.Parameters.AddWithValue("@City_ID", p._CityID);
            cmd.Parameters.AddWithValue("@EMail", p._EMail);
            cmd.Parameters.AddWithValue("@Gender", p._Gender);
            cmd.Parameters.AddWithValue("@Mobile", p._Mobile);
            cmd.Parameters.AddWithValue("@FN", p._FN);
            cmd.Parameters.AddWithValue("@LN", p._LN);
            cmd.Parameters.AddWithValue("@Password", p._Password);
            cmd.Parameters.AddWithValue("@Username", p._Username);
            cmd.Parameters.AddWithValue("@ID", p._ID);
            cmd.Parameters.AddWithValue("@AddID", p._AddID);
            cmd.Parameters.AddWithValue("@EditID", p._EditID);
            cmd.Parameters.AddWithValue("@CrDate", p._CrDate);
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