Public Class ReqUrl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dic As New Dictionary(Of String, String)
        dic.Add("ApplicationPath", Request.ApplicationPath)
        dic.Add("CurrentExecutionFilePath", Request.CurrentExecutionFilePath)
        dic.Add("FilePath", Request.FilePath)
        dic.Add("Path", Request.Path)
        dic.Add("PathInfo", Request.PathInfo)
        dic.Add("PhysicalApplicationPath", Request.PhysicalApplicationPath)
        dic.Add("PhysicalPath", Request.PhysicalPath)
        dic.Add("RawUrl", Request.RawUrl)
        dic.Add("Url", Request.Url.ToString())
        grid.DataSource = dic
        Page.DataBind()
    End Sub

End Class