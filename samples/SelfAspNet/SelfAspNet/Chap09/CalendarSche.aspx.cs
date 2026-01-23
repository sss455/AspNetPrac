using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class CalendarSche : System.Web.UI.Page
    {
        private DataView schedule;
        protected void Page_Load(object sender, EventArgs e)
        {
            schedule = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        }

        protected void cal_DayRender(object sender, DayRenderEventArgs e)
        {
            schedule.RowFilter =
                $"sdate = '{e.Day.Date:yyyy/MM/dd}'";
            foreach (DataRowView row in schedule)
            {
                var ltr = new Literal();
                ltr.Text = "<br />" + row["item"];
                e.Cell.Controls.Add(ltr);
            }
        }
    }
}