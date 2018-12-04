using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ProdBal
/// </summary>
public class ProdBal
{
    public int AddBal(ProdProp pr)
    {
        try
        {
            ProdDal dal = new ProdDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(ProdProp pr)
    {
        try
        {
            ProdDal dal = new ProdDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}