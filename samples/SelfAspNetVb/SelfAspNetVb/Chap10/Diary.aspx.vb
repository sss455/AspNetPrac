Imports Microsoft.AspNet.FriendlyUrls

Public Class Diary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        list.DataSource = Request.GetFriendlyUrlSegments()
        list.DataBind()
    End Sub

End Class