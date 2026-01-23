Imports System.ComponentModel
Imports System.Data.SqlClient

Namespace AlbumDataSetTableAdapters
    Partial Public Class AlbumTableAdapter
        <DataObjectMethod(DataObjectMethodType.Select, True)>
        Public Function GetAlbumData(category As String) As DataSet
            Dim setting As ConnectionStringSettings =
                ConfigurationManager.ConnectionStrings("SelfAsp")
            Dim db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand()
            comm.Connection = db
            If category = "無選択" Then
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album"
            Else
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album WHERE category = @category"
                comm.Parameters.AddWithValue("@category", category)
            End If
            Dim ds As New DataSet()
            Dim adapter As New SqlDataAdapter(comm)
            adapter.Fill(ds, "Album")
            Return ds
        End Function

        <DataObjectMethod(DataObjectMethodType.Select, False)>
        Public Function GetAlbumPaging(
            startRowIndex As Integer,
            maximumRows As Integer) As AlbumDataSet.AlbumDataTable
            Dim comm As SqlCommand = Me.Connection.CreateCommand()
            comm.CommandText = String.Format("SELECT aid, comment, updated, favorite, category FROM Album ORDER BY updated DESC OFFSET {0} ROWS FETCH NEXT {1} ROWS ONLY", startRowIndex, maximumRows)
            Me.Adapter.SelectCommand = comm
            Dim ds As New AlbumDataSet()
            Me.Adapter.Fill(ds, "Album")
            Return ds.Album
        End Function
    End Class
End Namespace