using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace SelfAspNet.Chap10
{
    public class LoggingModule : IHttpModule    // ←すべてのHTTPモジュールクラスは必ずIHttpModuleインターフェイスを実装する必要がある。
    {
        /// <summary>
        /// モジュールを使用するには、Web の Web.config ファイルでこの
        /// モジュールを設定し、IIS に登録する必要があります。詳細については、
        /// 次のリンクをご覧ください: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpModule Members

        // 自動生成：アプリケーション起動時
        public void Init(HttpApplication context)
        {
            // LogRequest イベントの処理方法とそれに対するカスタム ログの 
            // 実装方法の例を以下に示します
            //context.LogRequest += new EventHandler(OnLogRequest);

            // p.534 [Mod] HttpApplication.EndRequestイベントに対して、Application_EndRequestイベントハンドラーの関連付け
            context.EndRequest += this.Application_EndRequest;
        }

        // 自動生成：アプリケーション終了時
        public void Dispose()
        {
            //後処理用コードはここに追加します。
        }

        #endregion

        // 自動生成
        public void OnLogRequest(Object sender, EventArgs e)
        {
            //カスタム ログのロジックはここに挿入します
        }

        // すべてのリクエスト処理が完了したタイミングで発生
        // p.534 [Add] アプリケーションへのアクセスログを記録
        public void Application_EndRequest(Object sender, EventArgs e)
        {
            HttpRequest req = ((HttpApplication)sender).Request;

            // データベース接続の準備
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            using(var connection = new SqlConnection(setting.ConnectionString))
            {
                // コマンド発行の準備＋パラメータの追加
                var command = new SqlCommand("INSERT INTO AccessLog(  url,  userAgent,  referrer,  accessTime ) " +
                                                            "VALUES( @url, @userAgent, @referrer, @accessTime )", connection);
                command.Parameters.AddWithValue("@url",        req.Url.ToString());
                command.Parameters.AddWithValue("@userAgent",  req.UserAgent);
                command.Parameters.AddWithValue("@referrer",   req.UrlReferrer != null ? req.UrlReferrer.ToString() : "" );
                command.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString());

                // DB接続＋SQL発行
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
