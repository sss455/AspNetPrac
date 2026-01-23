Public Class Cookie
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Not IsNothing(Request.Cookies("email")) Then
                txtMail.Text = Request.Cookies("email").Value
            End If
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim cok As New HttpCookie("email", txtMail.Text)
        cok.Expires = DateTime.Now.AddMonths(3)
        Response.AppendCookie(cok)
    End Sub
End Class