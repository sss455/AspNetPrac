using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class AppSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Web.configの <appSettings> から key="Author" の value を取得
            ltrCode.Text = ConfigurationManager.AppSettings["Author"];
        }
    }
}