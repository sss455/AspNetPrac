using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class ValidGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                lblResult.Text = "すべて正しい値が入力されました。";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
                txtName.Text = string.Empty;
                txtWeight.Text = string.Empty;
                txtBirth.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtEmail2.Text = string.Empty;
        }
    }
}