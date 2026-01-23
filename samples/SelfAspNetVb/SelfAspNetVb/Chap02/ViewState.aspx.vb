Public Class ViewState
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            lblResult.Text = "こんにちは、世界！"
        End If
    End Sub

End Class