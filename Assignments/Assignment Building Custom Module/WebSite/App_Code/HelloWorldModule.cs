using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HelloWorldModule
/// </summary>
public class HelloWorldModule : IHttpModule
{

    public HelloWorldModule()
    {
    }

    public String ModuleName
    {
        get { return "HelloWorldModule"; }
    }

    // In the Init function, register for HttpApplication 
    // events by adding your handlers.
    public void Init(HttpApplication application)
    {
        application.BeginRequest +=
            (new EventHandler(this.Application_BeginRequest));
    }

    private void Application_BeginRequest(Object source,
         EventArgs e)
    {
        // Create HttpApplication and HttpContext objects to access
        // request and response properties.
        HttpApplication application = (HttpApplication)source;
        HttpContext context = application.Context;
        string ipAddress = context.Request.UserHostAddress;

        if (!IsValidIpAddress(ipAddress))
        {
            context.Response.Write("You can not access this website");
        }
        else
        {
            context.Response.Write("<h1><font color=red>" +
                "HelloWorldModule: Beginning of Request" +
                "</font></h1><hr>");
            HttpBrowserCapabilities bc = context.Request.Browser;
            context.Response.Write("<p>Browser Capabilities:</p>");
            context.Response.Write("Name = " + bc.Browser + "<br>");
        }

       private bool IsValidIpAddress(string checkIP)
        {
            return (checkIP != "192.168.1.98" || checkIP != "108.92.106.178");
        }

    public void Dispose() { }

}

}

