using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap07
{
    public partial class ViewStateGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 初期呼び出しで答えた回数（count）、解答（answer）を初期化
            if(!Page.IsPostBack)
            {
                var rnd = new Random();
                ViewState["count"] = 0;
                ViewState["answer"] = rnd.Next(100);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ViewState["count"] = Int32.Parse(ViewState["count"].ToString()) + 1;

            // 解答の正否を判定
            if (ViewState["answer"].ToString() == txtNum.Text)
            {
                // 正解の場合、正解メッセージを表示
                lblResult.Text = $"{ViewState["count"]}回で正解しました！";
                ViewState.Clear();
            }
            else
            {
                if(Int32.Parse(ViewState["answer"].ToString()) > Int32.Parse(txtNum.Text))
                {
                    lblResult.Text = "もう少し大きいです。";
                }
                else
                {
                    lblResult.Text = "もう少し小さいです。";
                }
            }
        }
    }
}