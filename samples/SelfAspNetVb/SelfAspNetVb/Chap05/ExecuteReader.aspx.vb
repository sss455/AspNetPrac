Imports System.Data.SqlClient

Public Class ExecuteReader
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim setting As ConnectionStringSettings =
            ConfigurationManager.ConnectionStrings("SelfAsp")
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("SELECT * FROM Book WHERE publish = @publish", db)
            comm.Parameters.AddWithValue("@publish", "翔泳社")
            db.Open()
            Dim reader As SqlDataReader = comm.ExecuteReader()
            Do While reader.Read()
                Response.Write(reader("title") & "<br />")
                'Response.Write(reader(1) & "<br />")
            Loop
            db.Close()
        End Using
    End Sub

End Class