using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
/// <summary>
/// Summary description for CatBal
/// </summary>
public class CatBal
{
    public int AddBal(CatProp pr)
    {
        try
        {
            CatDal dal = new CatDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(CatProp pr)
    {
        try
        {
            CatDal dal = new CatDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}