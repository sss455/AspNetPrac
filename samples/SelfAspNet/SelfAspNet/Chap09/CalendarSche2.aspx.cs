using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class CalendarSche2 : System.Web.UI.Page
    {
        private DataView schedule;
        protected void Page_Load(object sender, EventArgs e)
        {
            schedule = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        }

        protected void cal_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            schedule.RowFilter = $"sdate = '{e.Day.Date:yyyy/MM/dd}'";
            foreach (var row in schedule)
            {
                var ltr = new Literal();
                ltr.Text = "●";
                e.Cell.Controls.Add(ltr);
                break;
            }
        }
    }
}