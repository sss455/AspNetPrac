Public Class ViewStateGame
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim rnd As New Random()
            ViewState("count") = 0
            ViewState("answer") = rnd.Next(100)
        End If
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        ViewState("count") = ViewState("count") + 1
        If ViewState("answer") = txtNum.Text Then
            lblResult.Text = ViewState("count") & "回で正解しました！"
            ViewState.Clear()
        Else
            If ViewState("answer") > txtNum.Text Then
                lblResult.Text = "もう少し大きいです。"
            Else
                lblResult.Text = "もう少し小さいです。"
            End If
        End If
    End Sub
End Class