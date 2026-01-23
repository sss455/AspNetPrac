Public Class App1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Application.Lock()
        Application("title") = "独習ASP.NET"
        Application.UnLock()
    End Sub

End Class