Public Class SqlStored2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub sds_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sds.Selected
        lblNum.Text = e.Command.Parameters("@RETURN_VALUE").Value.ToString()
    End Sub
End Class