Imports System.ComponentModel
Imports System.Data.SqlClient

Public Class Album
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

    <DataObjectMethod(DataObjectMethodType.Delete, True)>
    Public Function DeleteAlbumData(aid As String) As Integer
        Dim result As Integer
        Dim setting As ConnectionStringSettings =
          ConfigurationManager.ConnectionStrings("SelfAsp")
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("DELETE FROM Album WHERE aid = @aid", db)
            comm.Parameters.AddWithValue("@aid", aid)
            db.Open()
            result = comm.ExecuteNonQuery()
            db.Close()
        End Using
        Return result
    End Function
End Class
