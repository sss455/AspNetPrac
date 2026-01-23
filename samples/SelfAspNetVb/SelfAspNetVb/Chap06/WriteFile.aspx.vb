Public Class WriteFile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.ContentType = "image/jpeg"
        Response.WriteFile(Server.MapPath("~/Image/A0001.jpg"))
        Response.End()
    End Sub

End Class