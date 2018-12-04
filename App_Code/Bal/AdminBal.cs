using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AdminBal
/// </summary>
public class AdminBal
{
    public int AddBal(AdminProp pr)
    {
        try
        {
            AdminDal dal = new AdminDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(AdminProp pr)
    {
        try
        {
            AdminDal dal = new AdminDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}