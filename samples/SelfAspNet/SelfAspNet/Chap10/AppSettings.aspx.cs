using System;
using System.Configuration;

namespace SelfAspNet.Chap10
{
    public partial class AppSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrCode.Text = ConfigurationManager.AppSettings["Author"];
        }
    }
}