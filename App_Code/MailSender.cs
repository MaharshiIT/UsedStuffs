
using System.Net;
using System.Net.Mail;
using System;
public class MailSender
{
    public static bool SendEmail(
        string pFrom, 
        string pUser,
        string pPassword,
        string pTo, 
        string pSubject,
        string pBody, 
        string pAttachmentPath)
    {
        try
        {
        MailMessage myMail = new MailMessage();
        myMail.From = new MailAddress(pFrom);
        myMail.To.Add(pTo);
        myMail.Subject = pSubject;
        myMail.IsBodyHtml=true;
        myMail.Body = pBody;
        SmtpClient sc = new SmtpClient();
        sc.Credentials = new NetworkCredential(pUser, pPassword);
        sc.Host = "smtp.gmail.com";
        sc.Port = 587;
        sc.EnableSsl = true;
        sc.Send(myMail);
        return true;

        }
        catch (Exception ex)
        {
            return false;
        }
    }
    
     public static string base64Encode(string sData)
     {
         try
         {
             byte[] encData_byte = new byte[sData.Length];

             encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);

             string encodedData = Convert.ToBase64String(encData_byte);

             return encodedData;

         }
         catch (Exception ex)
         {
             throw new Exception("Error in base64Encode" + ex.Message);
         }
     }

    public static string base64Decode(string sData)
    {
    try
    {

    System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();

    System.Text.Decoder utf8Decode = encoder.GetDecoder();

    byte[] todecode_byte = Convert.FromBase64String(sData);

    int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);

    char[] decoded_char = new char[charCount];

    utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);

    string result = new String(decoded_char);

    return result;
    }
    catch (Exception ex)
    {
    throw new Exception("Error in base64Decode" + ex.Message);
    }

    }

    

}

