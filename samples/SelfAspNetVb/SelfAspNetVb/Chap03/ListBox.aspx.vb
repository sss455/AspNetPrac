Public Class ListBox
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub list_SelectedIndexChanged(sender As Object, e As EventArgs) Handles list.SelectedIndexChanged
        For Each item As ListItem In list.Items
            If item.Selected Then
                Response.Write(item.Value & "<br />")
            End If
        Next
    End Sub
End Class