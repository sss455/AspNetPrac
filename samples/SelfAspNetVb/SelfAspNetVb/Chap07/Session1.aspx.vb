Public Class Session1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("title") = "独習ASP.NET"
    End Sub

End Class