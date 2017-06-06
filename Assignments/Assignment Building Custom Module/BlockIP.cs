using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HongAssign1.App_Code
{
   
    public class BlockIP : IHttpModule
    {

        public BlockIP()
        {
        }

        public String ModuleName
        {
            get { return "BlockIP"; }
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

            if (ipAddress == "108.92.106.178")
            {
                context.Response.Write("You can not access this website");
                context.Response.StatusCode = 403;  // (Forbidden)
            }
            else
            {
                context.Response.Write("<h1><font color=red>" +
                    "BlockIP: Beginning of Request" +
                    "</font></h1><hr>");
                HttpBrowserCapabilities bc = context.Request.Browser;
                context.Response.Write("<p>Browser Capabilities:</p>");
                context.Response.Write("Name = " + bc.Browser + "<br>");
                context.Response.Write("<p> </p>");
            }
        }

        public void Dispose() { }

    }
}

