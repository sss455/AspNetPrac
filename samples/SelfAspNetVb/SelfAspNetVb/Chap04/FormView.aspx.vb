Public Class FoemView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub fv_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles fv.ItemUpdated
        Response.Redirect("GridViewBook.aspx")
        'Server.Transfer("GridViewBook.aspx")
        'Response.RedirectPermanent("http://www.wings.msn.to/")
        'fv.DefaultMode = FormViewMode.Insert
    End Sub

    Protected Sub fv_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles fv.ItemUpdating
        If Int32.Parse(e.NewValues("price")) <= 0 Then
            e.NewValues("price") = e.OldValues("price")
        End If

        'Dim txtPrice As TextBox = DirectCast(fv.FindControl("priceTextBox"), TextBox)
        'If Int32.Parse(txtPrice.Text) <= 0 Then
        '    e.NewValues("price") = e.OldValues("price")
        'End If
    End Sub
End Class