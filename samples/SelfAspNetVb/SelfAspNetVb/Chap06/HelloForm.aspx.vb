Public Class HelloForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        lblGreet.Text = "こんにちは、" & Request.Form("txtName") & "さん！"
    End Sub
End Class