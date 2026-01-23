using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using System.Web.UI;
using System.Web.Optimization;

namespace SelfAspNetApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);

            //------------------------------------------------------------------------------
            // p.597 [Add] jQueryをアプリケーションに登録する
            //------------------------------------------------------------------------------
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, new ScriptResourceDefinition()
            {
                Path = "~/Scripts/jquery-3.7.1.min.js",
                DebugPath = "~/Scripts/jquery-3.7.1.js",
                CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.min.js",
                CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.js"
            });

            //------------------------------------------------------------------------------
            // p.600 [Add] バンドル情報を登録する
            //------------------------------------------------------------------------------
            // バンドル対象のファイル(群)と呼び出しのためのURLとを紐づけ、アプリケーションに登録しておく。
            // 以下の設定で「~/Scripts/BookSearch.js」というスクリプトが「~/bundles/my」というパスで呼び出せるようになる。
            BundleTable.Bundles.Add(new ScriptBundle("~/bundles/my").Include("~/Scripts/BookSearch.js"));
            // バンドル＆ミニフィケーションは、デバックモードでは無効となるため、デバッグモードでも強制的に有効にする
            BundleTable.EnableOptimizations = true;
        }
    }
}