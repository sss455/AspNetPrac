Imports System.Data.SqlClient

Public Class NonAccess
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim setting As ConnectionStringSettings =
            ConfigurationManager.ConnectionStrings("SelfAsp")
        Dim adapter As New SqlDataAdapter("SELECT * FROM Book WHERE publish = @publish", setting.ConnectionString)
        adapter.SelectCommand.Parameters.AddWithValue("@publish", "翔泳社")

        'Dim db As New SqlConnection(setting.ConnectionString)
        'Dim comm As New SqlCommand("SELECT * FROM Book WHERE publish = @publish", db)
        'comm.Parameters.AddWithValue("@publish", "翔泳社")
        'Dim adapter As New SqlDataAdapter(comm)

        Dim ds As New DataSet()
        adapter.Fill(ds, "Book")
        For i As Integer = 0 To ds.Tables("Book").Rows.Count - 1
            Response.Write(ds.Tables("Book").Rows(i)("title") & "<br />")
        Next

    End Sub

End Class