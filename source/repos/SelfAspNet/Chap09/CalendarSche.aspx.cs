using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class CalendarSche : System.Web.UI.Page
    {
        private DataView schedule;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 登録済みのスケジュール情報（DataViewオブジェクト）を取得
            schedule = (DataView) sds.Select(DataSourceSelectArguments.Empty);
            // SELECT sdate, subject + ' ' + stime + N'～' As item, uid FROM Schedule WHERE (uid=@uid) ORDER BY sdate, stime

            // カレンダーの初期表示を「2019/12/01」とする
            cal.VisibleDate = DateTime.Parse("2019/12/01");
        }


        // それぞれの日付セルを描画するタイミングで実行
        protected void cal_DayRender(object sender, DayRenderEventArgs e)
        {
            // 取得したDataViewオブジェクトを現在の日付でフィルター
            schedule.RowFilter = $"sdate = '{e.Day.Date: yyyy/MM/dd}'";

            // フィルター済みのスケジュール情報を順に出力
            foreach (DataRowView row in schedule)
            {
                var ltr = new Literal();
                ltr.Text = "<br />" + row["item"];
                e.Cell.Controls.Add(ltr);
            }
        }
    }
}