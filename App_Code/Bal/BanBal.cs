using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BanBal
/// </summary>
public class BanBal
{
    public int AddBal(BanProp pr)
    {
        try
        {
            BanDal dal = new BanDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(BanProp pr)
    {
        try
        {
            BanDal dal = new BanDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}