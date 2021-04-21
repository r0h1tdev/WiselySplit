using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WiselySplit
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string jquerystr = "1.7.1";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-" + jquerystr + ".min.js",
                DebugPath = "~/Scripts/jquery-" + jquerystr + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + jquerystr + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + jquerystr + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });
            string jqueryUIstr = "1.8.20";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery.ui.combined", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-ui-" + jqueryUIstr + ".min.js",
                DebugPath = "~/Scripts/jquery-ui-" + jqueryUIstr + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jquery.ui/" + jqueryUIstr + "/jquery-ui.min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jquery.ui/" + jqueryUIstr + "/jquery-ui.js",
                CdnSupportsSecureConnection = true
            });

        }
    }
}