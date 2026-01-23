Public Class UpdatePanel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCurrent.Text = DateTime.Now.ToString()
    End Sub

End Class