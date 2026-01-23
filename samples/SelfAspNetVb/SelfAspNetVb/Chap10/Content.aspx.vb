Public Class Content
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mst As MasterPage = Page.Master
        Dim img As Image = DirectCast(mst.FindControl("img"), Image)
        img.ImageUrl = "http://www.web-deli.com/image/logo.gif"
    End Sub

End Class