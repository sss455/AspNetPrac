using iText.IO.Font;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap06
{
    public partial class OutputStream : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 新規のPDF文書を生成
            var doc = new Document(
                new PdfDocument(
                    new PdfWriter(Response.OutputStream)
                )
            );

            // UTF-8エンコード
            var encoding = Encoding.GetEncoding("UTF-8");

            // MSゴシックフォント
            //var font = PdfFontFactory.CreateTtcFont("c:/windows/fonts/msgothis.ttc", 1, PdfEncodings.IDENTITY_H, true, true);
            var font = PdfFontFactory.CreateTtcFont(encoding.GetBytes("c:/windows/fonts/msgothis.ttc"), 1, PdfEncodings.IDENTITY_H, PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED, true);
            //var font = PdfFontFactory.CreateTtcFont("c:/windows/fonts/msgothis.ttc", 1, PdfEncodings.IDENTITY_H, PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED, true);

            // フォントを設定
            doc.SetFont(font);

            // 文字列を追加
            doc.Add(
                new Paragraph("こんにちは")
                    .Add(new Text("世界！！").SetFontSize(20))
            );

            // 文書の終了 & 出力の終了
            doc.Close();
            Response.End();
        }

    }
}