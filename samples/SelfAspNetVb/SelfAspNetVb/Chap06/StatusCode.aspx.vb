Public Class StatusCode
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.StatusCode = 403
        Response.Write("ページにアクセスできません。")
        Response.End()
    End Sub

End Class