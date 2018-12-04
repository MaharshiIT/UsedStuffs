using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProdProp
/// </summary>
public class ProdProp
{
    private int tag = 0;
    private int Prod_ID = 0;
    private string Name = "";
    private string Model = "";
    private string Color = "";
    private string Description = "";
    private double Price = 0;
    private int User_ID = 0;
    private string Photo = "";
    private int Cat_ID = 0;
    private int Sub_ID = 0;
    private string MfgDate = "";
    private string Status = "";
    private DateTime PostDate = DateTime.Now;
    public int _tag
    {
        get { return tag; }
        set { tag = value; }
    }
    public int _Prod_ID
    {
        get { return Prod_ID; }
        set { Prod_ID = value; }
    }
    public int _User_ID
    {
        get { return User_ID; }
        set { User_ID = value; }
    }
    public int _Cat_ID
    {
        get { return Cat_ID; }
        set { Cat_ID = value; }
    }
    public string _MfgDate
    {
        get { return MfgDate; }
        set { MfgDate = value; }
    }
    public string _Name
    {
        get { return Name; }
        set { Name = value; }
    }
    public string _Status
    {
        get { return Status; }
        set { Status = value; }
    }
    public string _Model
    {
        get { return Model; }
        set { Model = value; }
    }
    public string _Description
    {
        get { return Description; }
        set { Description = value; }
    }
    public string _Color
    {
        get { return Color; }
        set { Color = value; }
    }
    public double _Price
    {
        get { return Price; }
        set { Price = value; }
    }
    public string _Photo
    {
        get { return Photo; }
        set { Photo = value; }
    }
    public int _Sub_ID
    {
        get { return Sub_ID; }
        set { Sub_ID = value; }
    }
    public DateTime _PostDate
    {
        get { return PostDate; }
        set { PostDate = value; }

    }
}