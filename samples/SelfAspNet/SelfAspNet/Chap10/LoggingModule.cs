using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace SelfAspNet.Chap10
{
    public class LoggingModule : IHttpModule
    {
        /// <summary>
        /// モジュールを使用するには、Web の Web.config ファイルでこの
        /// モジュールを設定し、IIS に登録する必要があります。詳細については、
        /// 次のリンクをご覧ください: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpModule Members

        public void Dispose()
        {
            //後処理用コードはここに追加します。
        }

        public void Init(HttpApplication context)
        {
            context.EndRequest += this.Application_EndRequest;
        }

        #endregion

        public void OnLogRequest(Object source, EventArgs e)
        {
            //カスタム ログのロジックはここに挿入します
        }

        public void Application_EndRequest(object sender, EventArgs e)
        {
            var req = ((HttpApplication)sender).Request;
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("INSERT INTO AccessLog(url, userAgent, referrer, accessTime) VALUES(@url, @userAgent, @referrer, @accessTime)", db);
                comm.Parameters.AddWithValue("@url", req.Url.ToString());
                comm.Parameters.AddWithValue("@userAgent", req.UserAgent);
                comm.Parameters.AddWithValue("@referrer", req.UrlReferrer != null ? req.UrlReferrer.ToString() : "");
                comm.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString());
                db.Open();
                comm.ExecuteNonQuery();
            }
        }
    }
}
