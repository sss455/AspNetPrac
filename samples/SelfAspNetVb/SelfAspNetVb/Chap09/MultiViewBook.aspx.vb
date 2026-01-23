Public Class MultiViewBook
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grid_SelectedIndexChanging(sender As Object, e As GridViewSelectEventArgs) Handles grid.SelectedIndexChanging
        mv.ActiveViewIndex = 1
    End Sub
End Class