Public Class ContentType
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim reader As IDataReader = sds.Select(DataSourceSelectArguments.Empty)
        If reader.Read() Then
            Response.ContentType = reader("type")
            Response.BinaryWrite(reader("data"))
        Else
            Response.StatusCode = 404
            Response.Write("ページが見つかりませんでした")
        End If
        Response.End()
    End Sub

End Class