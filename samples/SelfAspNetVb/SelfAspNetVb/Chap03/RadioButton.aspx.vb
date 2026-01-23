Public Class RadioButton
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub list_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list.SelectedIndexChanged
        lblResult.Text = "「" & list.SelectedValue & "」が選択されました。"
        'lblResult.Text = "「" & list.Items(list.SelectedIndex).Value & "」が選択されました。"
        'lblResult.Text = "「" & list.SelectedItem.Value & "」が選択されました。"
    End Sub
End Class