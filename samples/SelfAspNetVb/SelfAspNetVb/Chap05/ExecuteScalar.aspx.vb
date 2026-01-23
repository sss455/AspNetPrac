Imports System.Data.SqlClient

Public Class ExecuteScalar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim setting As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("SelfAsp")
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("SELECT COUNT(*) FROM Book", db)
            db.Open()
            Response.Write(String.Format("登録数：{0}",
                comm.ExecuteScalar()))
            db.Close()
        End Using
    End Sub

End Class