using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap07
{
    public partial class Cookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["email"] != null)
                {
                    txtMail.Text = Request.Cookies["email"].Value;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var cok = new HttpCookie("email", txtMail.Text);
            cok.Expires = DateTime.Now.AddMonths(3);
            Response.AppendCookie(cok);
        }
    }
}