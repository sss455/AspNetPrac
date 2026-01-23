using System;

namespace SelfAspNet
{
    public partial class Hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            lblGreet.Text = $"こんにちは、{txtName.Text}さん！";
            //lblGreet.Text = Server.HtmlEncode($"こんにちは、{txtName.Text}さん！");
        }
    }
}