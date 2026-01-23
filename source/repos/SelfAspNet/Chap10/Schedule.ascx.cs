using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class Schedule : System.Web.UI.UserControl
    {
        private DataView schedule;

        // プロパティ
        public string Uid
        {
            get { return sds.SelectParameters["uid"].DefaultValue; }
            set { sds.SelectParameters["uid"].DefaultValue = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // 登録済みのスケジュール情報（DataViewオブジェクト）を取得
            schedule = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            // カレンダーの初期表示を「2019/12/01」に設定
            cal.VisibleDate = DateTime.Parse("2019/12/01");
        }

        // それぞれの日付セルを描画するタイミングで実行
        protected void cal_DayRender(object sender, DayRenderEventArgs e)
        {
            // 取得したDataViewオブジェクトを現在の日付でフィルター
            schedule.RowFilter = $"sdate= '{e.Day.Date: yyyy/MM/dd}'";

            // フィルター済みのスケジュール情報を順に出力
            foreach(DataRowView row in schedule)
            {
                var ltr = new Literal();
                ltr.Text = "<br />" + row["item"];
                e.Cell.Controls.Add(ltr);
            }
        }
    }
}