using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CatProp
/// </summary>
public class CatProp
{
    private int tag = 0;
    private int Cat_ID = 0;
    private int Sub_ID = 0;
    private string Name = "";
    private string SubName = "";

    public int _tag
    {
        get { return tag; }
        set { tag = value; }
    }
    public int _Cat_ID
    {
        get { return Cat_ID; }
        set { Cat_ID = value; }
    }
    public int _Sub_ID
    {
        get { return Sub_ID; }
        set { Sub_ID = value; }
    }
    public string _Name
    {
        get { return Name; }
        set { Name = value; }
    }
    public string _SubName
    {
        get { return SubName; }
        set { SubName = value; }
    }

    
}