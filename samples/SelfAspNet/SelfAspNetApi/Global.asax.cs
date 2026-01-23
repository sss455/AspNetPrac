using System;
using System.Web;
using System.Web.Http;
using System.Web.Optimization;
using System.Web.UI;

namespace SelfAspNetApi
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null,
            new ScriptResourceDefinition()
            {
                Path = "~/Scripts/jquery-3.4.1.min.js",
                DebugPath = "~/Scripts/jquery-3.4.1.js",
                CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.min.js",
                CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.js"
            });

            // アプリケーションのスタートアップで実行するコードです
            GlobalConfiguration.Configure(WebApiConfig.Register);
            BundleTable.Bundles.Add(new ScriptBundle("~/bundles/my").
                Include("~/Scripts/BookSearch.js"));
            BundleTable.EnableOptimizations = true;
        }
    }
}