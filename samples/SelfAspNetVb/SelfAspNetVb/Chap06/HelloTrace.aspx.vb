Public Class HelloTrace
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Trace.Write(txtName.Text & "（通常）")
        Trace.Warn(txtName.Text & "（警告）")
    End Sub

End Class