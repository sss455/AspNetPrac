Public Class MyApp
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sds.SelectParameters.Clear()
        sds.SelectParameters.Add("url", Request.AppRelativeCurrentExecutionFilePath)
        Dim reader As IDataReader = sds.Select(DataSourceSelectArguments.Empty)
        If reader.Read() Then
            Page.Header.Title = reader("title")
            Page.Header.Keywords = reader("keywd")
            Page.Header.Description = reader("description")
        End If
    End Sub

End Class