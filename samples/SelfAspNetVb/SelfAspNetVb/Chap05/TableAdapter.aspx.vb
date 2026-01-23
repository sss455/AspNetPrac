Public Class TableAdapter
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim adapter As New AlbumDataSetTableAdapters.AlbumTableAdapter
        Dim ds As New AlbumDataSet()
        adapter.Fill(ds.Album)
        For i As Integer = 0 To ds.Album.Rows.Count - 1
            Response.Write(ds.Album(i).aid & "<br />")
            'Response.Write(ds.Tables("Album").Rows(i)("aid") & "<br />")
        Next
    End Sub

End Class