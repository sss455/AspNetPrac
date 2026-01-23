using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet
{
    public partial class Hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 初期表示（ポストバックでない）
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