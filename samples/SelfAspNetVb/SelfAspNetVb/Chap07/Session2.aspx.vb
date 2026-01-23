Public Class Session2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("title") IsNot Nothing Then
            lblSession.Text = Session("title")
        End If
    End Sub

End Class