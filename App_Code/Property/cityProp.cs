using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cityProp
/// </summary>
public class cityProp
{
    private int tag = 0;
    private int City_ID = 0;
    private string State = "";
    private string City = "";

    public int _tag
    {
        get { return tag; }
        set { tag = value; }
    }
    public int _City_ID
    {
        get { return City_ID; }
        set { City_ID=value; }
    }
    public string _City
    {
        get { return City; }
        set { City = value; }
    }
    public string _State
    {
        get { return State; }
        set { State = value; }
    }
}