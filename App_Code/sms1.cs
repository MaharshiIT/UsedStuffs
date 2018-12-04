using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;

/// <summary>
/// Summary description for sms1
/// </summary>
public class sms1
{
    public int send(string uid, string password, string message, string no)
    {
        try
        {
            HttpWebRequest myReq =
            (HttpWebRequest)WebRequest.Create("http://ubaid.tk/sms/sms.aspx?uid=" + uid + "&pwd=" + password +
            "&msg=" + message + "&phone=" + no + "&provider=FullOnSMS");

            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
            return 1;
        }
        catch (Exception e)
        {
            return 0;
        }
    }
}