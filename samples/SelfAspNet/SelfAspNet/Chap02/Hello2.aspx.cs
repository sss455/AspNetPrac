using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap02
{
    public partial class Hello2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtName.Text = "権兵衛";
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            lblGreet.Text = $"こんにちは、{txtName.Text}さん！";
        }
    }
}