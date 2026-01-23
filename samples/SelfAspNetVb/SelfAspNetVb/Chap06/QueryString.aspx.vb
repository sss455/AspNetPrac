Public Class QueryString
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("id") IsNot Nothing Then
            lblResult.Text = Request.QueryString("id")
        End If
        'Response.Write(Server.UrlEncode("山田"))
    End Sub

End Class