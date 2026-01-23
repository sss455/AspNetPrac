Public Class Custom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cusName_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles cusName.ServerValidate
        args.IsValid = (args.Value.Length <= 20)
    End Sub
End Class