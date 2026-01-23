using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class CalendarBirth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cal_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            var stones = new [] { "ガーネット", "アメシスト", "アクアマリン", "ダイアモンド", "エメラルド", "パール", "ルビー", "ペリドット", "サファイア", "オパール", "トパーズ", "ターコイス" };
            cal.Caption = $"今月の誕生石： {stones[e.NewDate.Month - 1]}";
        }
    }
}