using iText.IO.Font;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using System;

namespace SelfAspNet.Chap06
{
    public partial class OutputStream : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var doc = new Document(
              new PdfDocument(
                new PdfWriter(Response.OutputStream)
              )
            );
            var font = PdfFontFactory.CreateTtcFont("c:/windows/fonts/msgothic.ttc", 1, PdfEncodings.IDENTITY_H, true, true);
            doc.SetFont(font);
            doc.Add(
              new Paragraph("こんにちは")
                .Add(new Text("世界!!").SetFontSize(20))
            );
            doc.Close();
            Response.End();
        }
    }
}