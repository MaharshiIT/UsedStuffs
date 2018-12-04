using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for UserBal
/// </summary>
public class UserBal
{
    public int AddBal(UserProp pr)
    {
        try
        {
        UserDal dal = new UserDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(UserProp pr)
    {
        try
        {
            UserDal dal = new UserDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}