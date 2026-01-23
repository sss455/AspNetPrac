Public Class CalendarBirth
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cal_VisibleMonthChanged(sender As Object, e As MonthChangedEventArgs) Handles cal.VisibleMonthChanged
        Dim stones As String() = {"ガーネット", "アメシスト", "アクアマリン", "ダイアモンド", "エメラルド", "パール", "ルビー", "ペリドット", "サファイア", "オパール", "トパーズ", "ターコイス"}
        cal.Caption = "今月の誕生石：&nbsp;" & stones(e.NewDate.Month - 1)
    End Sub
End Class