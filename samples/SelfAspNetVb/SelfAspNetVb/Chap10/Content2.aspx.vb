Public Class Content2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim img As Image = DirectCast(Page.Master.FindControl("img"), Image)
        img.AlternateText = "サイトロゴ"
    End Sub

End Class