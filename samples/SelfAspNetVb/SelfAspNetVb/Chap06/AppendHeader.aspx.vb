Public Class AppendHeader
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.AppendHeader("Content-Disposition", "attachment; filename=Book.csv")
    End Sub

End Class