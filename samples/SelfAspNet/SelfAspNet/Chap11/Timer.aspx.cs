using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap11
{
    public partial class Timer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurrent.Text = DateTime.Now.ToString();
            System.Threading.Thread.Sleep(3000);
            grid.DataBind();
        }
    }
}