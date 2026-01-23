Imports System.Transactions

Public Class Transaction
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grid_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles grid.RowDeleting
        Using ts As New TransactionScope()
            Dim adapter As New AlbumDataSetTableAdapters.AlbumTableAdapter()
            adapter.Delete(e.Keys("aid"))
            Dim result As Integer = adapter.InsertHistory(e.Keys("aid"), e.Values("comment"))
            If result > 0 Then
                ts.Complete()
            End If
        End Using
        e.Cancel = True
        grid.DataBind()
    End Sub
End Class