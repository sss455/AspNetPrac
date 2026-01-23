using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace SelfAspNet
{
    //---------------------------------------------------------------------------------------------------------
    // Global.asax（グローバルアプリケーションファイル）
    //   アプリケーションレベルで発生する各種イベント（アプリケーションイベント）を処理したり、
    //   アプリケーション／セッション共通で利用可能なオブジェクトの宣言を行うために使用します。
    //    ※ファイル名はGlobal.asax固定で、変更できない。
    //    ※必ずアプリケーションルート直下に配置する必要がある。
    //---------------------------------------------------------------------------------------------------------
    public class Global : System.Web.HttpApplication
    {
        //---------------------------------------------------------------------------------------------------------
        // p.512 [Add] 条件付きイベント
        //---------------------------------------------------------------------------------------------------------

        // アプリケーションが初回起動した1回のみ発生。
        protected void Application_Start(object sender, EventArgs e)
        {
            // p.100 [Add] jQueryをアプリケーションに登録する
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, new ScriptResourceDefinition()
            {
                Path         = "~/Scripts/jquery-3.7.1.min.js",
                DebugPath    = "~/Scripts/jquery-3.7.1.js",
                CdnPath      = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.min.js",
                CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.js"
            });

            // p.524 [Add] URLルーティングの設定
            // blogルートを定義
            RouteTable.Routes.MapPageRoute("blog", "blog/{year}/{month}/{day}", "~/Chap10/Blog.aspx");
            //// p.527 [Add] ルートパラメーターのデフォルト値を設定する
            //RouteTable.Routes.MapPageRoute(
            //    "blog",
            //    "blog/{year}/{month}/{day}",
            //    "~/Chap10/Blog.aspx",
            //    checkPhysicalUrlAccess: false,
            //    new RouteValueDictionary(new
            //        {
            //            year  = DateTime.Now.Year,
            //            month = DateTime.Now.Month,
            //            day   = DateTime.Now.Day,
            //        }
            //    ),
            //    // p.528 [Add] ルートパラメーターの設定値を制限する
            //    new RouteValueDictionary(new
            //        {
            //            year  = @"\d{4}",
            //            month = @"\d{1,2}",
            //            day   = @"\d{1,2}",
            //        }
            //    )
            //);
        }

        // ユーザーセッションが初回起動した1回のみ発生。
        protected void Session_Start(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Session_Start event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        // 
        protected void Session_End(object sender, EventArgs e)
        {

        }

        // 
        protected void Application_End(object sender, EventArgs e)
        {

        }

        // p.518 [Add] エラー情報をログファイルに記録する
        protected void Application_Error(object sender, EventArgs e)
        {
            using (var writer = new StreamWriter(
                                        Server.MapPath("~/App_Data/error.log"), append: true, Encoding.GetEncoding("Shift_JIS")
                                    ))
            {
                Exception err = Server.GetLastError().InnerException;

                if (err != null)
                {
                    // エラー情報の構築
                    var builder = new StringBuilder();
                    builder.Append(err.Source);
                    builder.Append("\t");
                    builder.Append(err.Message);
                    builder.Append("\t");
                    builder.Append(DateTime.Now.ToString());

                    // ログファイルに書き込み
                    writer.WriteLine(builder.ToString());
                }
            }
        }


        //---------------------------------------------------------------------------------------------------------
        // p.512 [Add] リクエストイベント
        //---------------------------------------------------------------------------------------------------------

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_BeginRequest event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_AuthenticateRequest event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_AuthorizeRequest(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_AuthorizeRequest event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_ResolveRequestCache(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_ResolveRequestCache event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_AcquireRequestState event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_PreRequestHandlerExecute event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_PostRequestHandlerExecute(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_PreRequestHandlerExecute event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_ReleaseRequestState(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_ReleaseRequestState event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_UpdateRequestCache(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_UpdateRequestCache event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        // p.515 [Add] アプリケーションへのアクセスログを記録
        protected void Application_EndRequest(object sender, EventArgs e)
        {
            //Trace.WriteLine("HttpApplication Application_EndRequest event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);


            /* HTTPモジュールのLoggingModule.csへ処理を移動 */

            //HttpRequest req = Context.Request;

            //// データベース接続の準備
            //ConnectionStringSettings setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            //using (var connecttion = new SqlConnection(setting.ConnectionString))
            //{
            //    // コマンド発行の準備＋パラメータの追加
            //    var command = new SqlCommand(@"INSERT INTO AccessLog(  url,  userAgent,  referrer,  accessTime ) " +
            //                                                 "Values( @url, @userAgent, @referrer, @accessTime )", connecttion);
            //    command.Parameters.AddWithValue("@url", req.Url.ToString());
            //    command.Parameters.AddWithValue("@userAgent", req.UserAgent);
            //    command.Parameters.AddWithValue("@referrer", req.UrlReferrer != null ? req.UrlReferrer.ToString() : "" );
            //    command.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString());

            //    // DB接続＋SQL発行
            //    connecttion.Open();
            //    command.ExecuteNonQuery();
            //}
        }

        protected void Application_PreSendRequestHandlers(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_PreSendRequestHandlers event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }

        protected void Application_PreSendRequestContent(object sender, EventArgs e)
        {
            Trace.WriteLine("HttpApplication Application_PreSendRequestContent event, Thread:" + System.Threading.Thread.CurrentThread.ManagedThreadId);
        }
    }
}