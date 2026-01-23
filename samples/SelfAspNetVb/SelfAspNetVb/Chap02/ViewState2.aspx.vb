Public Class ViewState2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtResult.Text = "こんにちは、世界！"
        End If
    End Sub

End Class