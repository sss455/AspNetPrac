using System;
using System.IO;
using System.Text;
using System.Web;

namespace SelfAspNet.Chap10
{
    public class ErrorLogHandler : IHttpHandler
    {
        /// <summary>
        /// ハンドラーを使用するには、Web の Web.config ファイルでこの 
        /// ハンドラーを設定し、IIS に登録する必要があります。詳細については、
        /// 次のリンクをご覧ください: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // マネージド ハンドラーが別の要求に再利用できない場合は、false を返します。
            // 要求ごとに保存された状態情報がある場合、通常、これは false になります。
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            var path = context.Server.MapPath("~/App_Data/error.log");
            using (var reader = new StreamReader(path, Encoding.GetEncoding("Shift_JIS")))
            {
                while (reader.Peek() > -1)
                {
                    context.Response.Write($"{context.Server.HtmlEncode(reader.ReadLine())}<br />");
                }
            }
        }

        #endregion
    }
}
