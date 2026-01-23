using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class Content : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var mst = Page.Master;
            var img = (Image)mst.FindControl("img");
            img.ImageUrl = "https://www.web-deli.com/image/logo.gif";
        }
    }
}