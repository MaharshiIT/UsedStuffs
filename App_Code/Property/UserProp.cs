using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserProp
/// </summary>
public class UserProp
{
    private int tag = 0;
    private int ID = 0;
    private string FN = "";
    private string LN = "";
    private string EMail = "";
    private string Address = "";
    private double Mobile = 0;
    private string Gender = "";
    private int City_ID = 0;
    private string Username = "";
    private string Password = "";
    private int AddID = 0;
    private int EditID = 0;
    private DateTime CrDate = DateTime.Now;
    public int _tag
    {
        get { return tag; }
        set { tag = value; }
    }
    public int _AddID
    {
        get { return AddID; }
        set { AddID = value; }
    }
    public int _EditID
    {
        get { return EditID; }
        set { EditID = value; }
    }
    public int _ID
    {
        get { return ID; }
        set { ID = value; }
    }
    public string _FN
    {
        get { return FN; }
        set { FN = value; }
    }
    public string _LN
    {
        get { return LN; }
        set { LN = value; }
    }
    public string _EMail
    {
        get { return EMail; }
        set { EMail = value; }
    }
    public string _Address
    {
        get { return Address; }
        set { Address = value; }
    }
    public double _Mobile
    {
        get { return Mobile; }
        set { Mobile = value; }
    }
    public string _Gender
    {
        get { return Gender; }
        set { Gender = value; }
    }
    public int _CityID
    {
        get { return City_ID; }
        set { City_ID = value; }
    }
    public string _Username
    {
        get { return Username; }
        set { Username = value; }
    }
    public string _Password
    {
        get { return Password; }
        set { Password = value; }
    }
    public DateTime _CrDate
    {
        get { return CrDate; }
        set { CrDate = value; }

    }
}