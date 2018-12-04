using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for cityBal
/// </summary>
public class cityBal
{
    public int AddBal(cityProp pr)
    {
        try
        {
            cityDal dal = new cityDal();
            return dal.Add(pr);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
    public DataTable fetchBal(cityProp pr)
    {
        try
        {
            cityDal dal = new cityDal();
            return dal.fetch(pr);
        }
        catch (Exception e)
        {
            return null;
        }
    }
}