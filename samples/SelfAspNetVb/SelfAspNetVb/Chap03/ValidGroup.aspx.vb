Public Class ValidGroup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            lblResult.Text = "すべて正しい値が入力されました。"
        End If
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        txtName.Text = ""
        txtWeight.Text = ""
        txtBirth.Text = ""
        txtEmail.Text = ""
        txtEmail2.Text = ""
    End Sub
End Class