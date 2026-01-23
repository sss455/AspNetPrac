using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cal_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = cal.SelectedDate.ToString("yyyy/MM/dd");
        }
    }
}