Public Class ChartParts
    Inherits System.Web.UI.UserControl

    Public Property Brand() As String
        Get
            Return sds.SelectParameters("brand").DefaultValue
        End Get
        Set(ByVal value As String)
            sds.SelectParameters("brand").DefaultValue = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class