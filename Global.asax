<%@ Application Language="C#" %>
<script runat="server">
   
    void Application_Start(object sender, EventArgs e) 
    {
        
           
        
           
       
        try
        {
            
            string result = string.Empty;
            string ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ip))
            {
                string[] ipRange = ip.Split(',');
                int le = ipRange.Length - 1;
                result = ipRange[0];
            }
            else
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            
            
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataConnect"].ConnectionString);
            string query = "insert into Userlog_master(IP,DateTime,Browser) values('" + result + "','" + DateTime.Now + "','"+HttpContext.Current.Request.Browser.Browser+"')";
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
            con.Open();
           int i = cmd.ExecuteNonQuery();
           con.Close();
        }
        catch (Exception ex)
        {
        }
        

    }
    protected void Application_BeginRequest(object sender, EventArgs e)
    {
       
        String fullOrigionalpath = Request.Url.ToString();
        String[] sElements = fullOrigionalpath.Split('/');
        String[] sFilePath = sElements[sElements.Length - 1].Split('.');
        if (fullOrigionalpath.Contains("admin"))
        {
            if (!fullOrigionalpath.Contains(".aspx") && sFilePath.Length == 1)
            {
                Context.RewritePath(sFilePath[0] + ".aspx");
            }
        }
        else
        {
            if (fullOrigionalpath.Contains("Index") || fullOrigionalpath.Contains("About") || fullOrigionalpath.Contains("Account") || fullOrigionalpath.Contains("ChangePass") || fullOrigionalpath.Contains("Confirm") || fullOrigionalpath.Contains("Login") || fullOrigionalpath.Contains("Logout") || fullOrigionalpath.Contains("PostProd") || fullOrigionalpath.Contains("ProdDetails") || fullOrigionalpath.Contains("Products") || fullOrigionalpath.Contains("Recovery") || fullOrigionalpath.Contains("Signup") || fullOrigionalpath.Contains("UserDetails") || fullOrigionalpath.Contains("IQTest"))
            {

                if (sFilePath[0].Contains("?"))
                {
                    string[] sf = sFilePath[0].Split('?');
                    if (!fullOrigionalpath.Contains(".aspx") && sf.Length == 2)
                    {

                        Context.RewritePath(sf[0] + ".aspx");
                    }


                }


                else
                {

                    if (!fullOrigionalpath.Contains(".aspx") && sFilePath.Length == 1)
                    {
                        Context.RewritePath(sFilePath[0] + ".aspx");
                    }
                }
            }
        }
    }
    
        
    
    void Application_End(object sender, EventArgs e) 
    {

       

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        

    }

    void Session_End(object sender, EventArgs e) 
    {
        

    }
       
</script>
