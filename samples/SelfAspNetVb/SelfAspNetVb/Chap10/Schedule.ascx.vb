Public Class Schedule
    Inherits System.Web.UI.UserControl
    Private schedule As DataView

    Public Property Uid() As String
        Get
            Return sds.SelectParameters("uid").DefaultValue
        End Get
        Set(ByVal value As String)
            sds.SelectParameters("uid").DefaultValue = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        schedule = sds.Select(DataSourceSelectArguments.Empty)
    End Sub

    Protected Sub cal_DayRender(sender As Object, e As DayRenderEventArgs) Handles cal.DayRender
        schedule.RowFilter = String.Format("sdate='{0}'",
            e.Day.Date.ToString("yyyy/MM/dd"))
        For Each row As DataRowView In schedule
            Dim ltr = New Literal()
            ltr.Text = "<br />" & row("item")
            e.Cell.Controls.Add(ltr)
        Next
    End Sub
End Class