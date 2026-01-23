using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class Valid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // ページ内のすべての検証コントロールの正否をまとめて確認
            if(Page.IsValid)
            {
                lblResult.Text = "すべて正しい値が入力されました。";
            }

            // 個々の検証コントロールのIsValidプロパティを1つ1つ確認
            if (reqName.IsValid && rngWeight.IsValid && cmpBirth.IsValid && regEmail.IsValid && cmpEmail2.IsValid)
            {
                lblResult.Text = "すべて正しい値が入力されました。";
            }
        }
    }
}