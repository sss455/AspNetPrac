Public Class GridViewTemplate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grid_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles grid.RowUpdating
        If Not Page.IsValid Then
            e.Cancel = True
        Else
            ' 更新前の任意の処理
        End If
    End Sub

    Protected Sub grid_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles grid.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Response.Write(e.Exception.Message)
        End If
    End Sub

    Protected Sub grid_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles grid.RowCreated
        If e.Row.RowType = DataControlRowType.Footer Then
            Dim ltr As New Literal()
            ltr.Text = "総ページ数：" & grid.PageCount
            e.Row.Cells(e.Row.Cells.Count - 1).Wrap = False
            e.Row.Cells(e.Row.Cells.Count - 1).Controls.Add(ltr)
        End If
    End Sub
End Class