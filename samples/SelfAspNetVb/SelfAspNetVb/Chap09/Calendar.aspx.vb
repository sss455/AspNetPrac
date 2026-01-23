Public Class Calendar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cal_SelectionChanged(sender As Object, e As EventArgs) Handles cal.SelectionChanged
        txtDate.Text = cal.SelectedDate.ToString("yyyy/MM/dd")
    End Sub
End Class