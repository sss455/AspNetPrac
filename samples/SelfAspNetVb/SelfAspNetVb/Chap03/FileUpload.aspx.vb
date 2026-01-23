Imports System.IO

Public Class FileUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        If upload.HasFile Then
            Dim postfile As HttpPostedFile = upload.PostedFile
            Dim uppath As String = Server.MapPath("~/App_Data/doc/") &
              Path.GetFileName(postfile.FileName)
            postfile.SaveAs(uppath)
            lblResult.Text = postfile.FileName & " をアップロードしました。"
        End If
    End Sub
End Class