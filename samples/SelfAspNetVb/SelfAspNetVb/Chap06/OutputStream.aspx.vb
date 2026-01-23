Imports iText.IO.Font
Imports iText.Kernel.Font
Imports iText.Kernel.Pdf
Imports iText.Layout
Imports iText.Layout.Element
Imports System

Public Class OutputStream
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim doc As New Document(New PdfDocument(
                New PdfWriter(Response.OutputStream)
              ))
        Dim font As PdfFont = PdfFontFactory.CreateTtcFont("c:/windows/fonts/msgothic.ttc", 1, PdfEncodings.IDENTITY_H, True, True)
        doc.SetFont(font)
        doc.Add(
              New Paragraph("こんにちは").Add(New iText.Layout.Element.Text("世界!!").SetFontSize(20))
            )
        doc.Close()
        Response.End()
    End Sub

End Class