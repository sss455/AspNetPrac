Imports System.IO

Public Class FileUploadMulti
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        If upload.HasFile Then
            Dim result As String = ""
            For Each f As HttpPostedFile In upload.PostedFiles
                f.SaveAs(Server.MapPath("~/App_Data/doc/") &
                    Path.GetFileName(f.FileName))
                result &= f.FileName & " "
            Next
            lblResult.Text = result & "をアップロードしました。"
        End If
    End Sub
End Class