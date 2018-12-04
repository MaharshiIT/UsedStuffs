using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BanProp
/// </summary>
public class BanProp
{
    private int tag = 0;
    private int Banner_ID = 0;
    private int Pos = 0;
    private string Link = "";
    private string Name = "";

    public int _tag
    {
        get { return tag; }
        set { tag = value; }
    }
    public int _Banner_ID
    {
        get { return Banner_ID; }
        set { Banner_ID = value; }
    }
    public int _Pos
    {
        get { return Pos; }
        set { Pos = value; }
    }
    public string _Name
    {
        get { return Name; }
        set { Name = value; }
    }
    public string _Link
    {
        get { return Link; }
        set { Link = value; }
    }

}