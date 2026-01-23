Public Class CalendarSche2
    Inherits System.Web.UI.Page
    Private schedule As DataView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        schedule = sds.Select(DataSourceSelectArguments.Empty)
    End Sub

    Protected Sub cal_DayRender(sender As Object, e As DayRenderEventArgs) Handles cal.DayRender
        schedule.RowFilter = String.Format("sdate='{0}'",
            e.Day.Date.ToString("yyyy/MM/dd"))
        For Each row As DataRowView In schedule
            Dim ltr = New Literal()
            ltr.Text = "●"
            e.Cell.Controls.Add(ltr)
            Exit For
        Next
    End Sub
End Class