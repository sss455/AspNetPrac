Public Class Hello2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtName.Text = "権兵衛"
        End If
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        lblGreet.Text = "こんにちは、" & txtName.Text & "さん！"
    End Sub
End Class