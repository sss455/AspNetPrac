Public Class UpdateProgress
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblCurrent.Text = DateTime.Now.ToString()
        System.Threading.Thread.Sleep(3000)
    End Sub

End Class