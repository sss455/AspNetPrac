Public Class AppSettings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ltrCode.Text = ConfigurationManager.AppSettings("Author")
    End Sub

End Class