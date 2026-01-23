Public Class PhotoUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        sds.InsertParameters.Add("type", upfile.PostedFile.ContentType)
        sds.Insert()
    End Sub
End Class