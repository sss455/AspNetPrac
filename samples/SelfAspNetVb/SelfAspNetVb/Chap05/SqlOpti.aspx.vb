Public Class SqlOpti
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub sds_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sds.Updated
        If e.AffectedRows = 0 Then
            lblError.Text = "データの競合が発生しました。データは更新されません。"
        End If
    End Sub
End Class