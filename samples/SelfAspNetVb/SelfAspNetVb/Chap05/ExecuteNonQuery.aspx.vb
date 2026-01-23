Imports System.Data.SqlClient

Public Class ExecuteNonQuery
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim setting As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("SelfAsp")
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("UPDATE Book SET title = @title WHERE isbn = @isbn", db)
            comm.Parameters.AddWithValue("@title", "JavaScript逆引きレシピ 第2版")
            comm.Parameters.AddWithValue("@isbn", "978-4-7981-5757-3")
            db.Open()
            comm.ExecuteNonQuery()
            db.Close()
        End Using
    End Sub

End Class