using System;
using System.Web.UI;

namespace SelfAspNet.Chap07
{
    public partial class ViewStateGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var rnd = new Random();
                ViewState["count"] = 0;
                ViewState["answer"] = rnd.Next(100);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            ViewState["count"] =
                Int32.Parse(ViewState["count"].ToString()) + 1;
            if (ViewState["answer"].ToString() == txtNum.Text)
            {
                lblResult.Text = $"{ViewState["count"]}回で正解しました！";
                ViewState.Clear();
            }
            else
            {
                if (Int32.Parse(ViewState["answer"].ToString())
                    > Int32.Parse(txtNum.Text))
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