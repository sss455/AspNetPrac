using System;
using System.IO;
using System.Text;
using System.Web;

namespace SelfAspNet.Chap10
{
    public class SourceOutputHandler : IHttpHandler
    {
        /// <summary>
        /// ハンドラーを使用するには、Web の Web.config ファイルでこの 
        /// ハンドラーを設定し、IIS に登録する必要があります。詳細については、
        /// 次のリンクをご覧ください: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        // 自動生成：インスタンスが再利用可能かを宣言
        public bool IsReusable
        {
            // マネージド ハンドラーが別の要求に再利用できない場合は、false を返します。
            // 要求ごとに保存された状態情報がある場合、通常、これは false になります。
            get { return true; }
        }

        // 自動生成：HTTPハンドラーの実処理を規定
        public void ProcessRequest(HttpContext context)
        {
            // リクエストURLの物理パスから「.src」を取り除いた絶対パスを生成
            string orgPath = context.Request.PhysicalPath;
            string fileName = Path.GetFileNameWithoutExtension(orgPath);
            string srcPath = Path.Combine(Path.GetDirectoryName(orgPath), fileName);

            // ソースコードを行番号付きで読み込み
            using (var reader = new StreamReader(srcPath, Encoding.UTF8))
            {
                HttpResponse Response = context.Response;
                Response.Write("<html>");
                Response.Write($"<head><title>{fileName}</title></head>");
                Response.Write("<body>");
                Response.Write($"<h1>{fileName}</h1>");
                Response.Write("<table border='0'>");

                // 行番号
                var lineNum = 1;

                while (reader.Peek() > -1)
                {
                    Response.Write("<tr>");
                    Response.Write($"<th align='right'>{lineNum}</th>");

                    // テキストはHTMLエンコードし、空白も置換
                    string line = context.Server.HtmlEncode(reader.ReadLine());
                    Response.Write($"<td>{line.Replace(" ", "&nbsp;")}</td></tr>");
                    
                    // 行番号をインクリメント
                    lineNum++;
                }
                Response.Write("</body>");
                Response.Write("</html>");
            }
        }

        #endregion
    }
}
