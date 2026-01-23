Imports System.ComponentModel
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.Owin

<Designer(GetType(System.Web.UI.Design.ControlDesigner))>
<DefaultProperty("ProfileName")>
<ToolboxData("<{0}:ProfileLabel runat=server></{0}:ProfileLabel>")>
Public Class ProfileLabel
    Inherits Label

    <Bindable(True)>
    <Category("Behavior")>
    <DefaultValue("")>
    <Localizable(True)>
    <Description("プロファイル名")>
    Public Property ProfileName() As String
        Get
            Dim s As String = CStr(ViewState("ProfileName"))
            If s Is Nothing Then
                Return String.Empty
            Else
                Return s
            End If
        End Get

        Set(ByVal Value As String)
            ViewState("ProfileName") = Value
        End Set
    End Property

    <Browsable(False)>
    Public Overrides Property Text() As String
        Get
            Return ""
        End Get
        Set(ByVal value As String)
            Throw New NotSupportedException
        End Set
    End Property

    Protected Overrides Sub RenderContents(ByVal writer As HtmlTextWriter)
        If Context IsNot Nothing Then
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim user = manager.FindByName(Context.User.Identity.Name)
            writer.Write(GetType(ApplicationUser).GetProperty(ProfileName).GetValue(user))
        Else
            writer.Write(String.Format("[{0}]", Me.ID))
        End If
    End Sub

End Class
