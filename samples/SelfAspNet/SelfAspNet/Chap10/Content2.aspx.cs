using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class Content2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var img = (Image)Page.Master.FindControl("img");
            img.AlternateText = "サイトロゴ";
        }
    }
}