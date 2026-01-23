using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class Limit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // サイトマップファイル上の現在のページ（ノード）を取得
            SiteMapNode nodCur = SiteMap.CurrentNode;

            // 現在のページを取得できた場合のみ、以下の処理
            if(nodCur != null)
            {
                // 前後／上位ページを取得
                SiteMapNode nodPrev   = nodCur.PreviousSibling;
                SiteMapNode nodParent = nodCur.ParentNode;
                SiteMapNode nodNext   = nodCur.NextSibling;

                // 前後／上位ページへのリンクを設定
                this.SetHyperLink(lnkPrev,   nodPrev);
                this.SetHyperLink(lnkParent, nodParent);
                this.SetHyperLink(lnkNext,   nodNext);
            }
        }

        private void SetHyperLink(HyperLink link, SiteMapNode node)
        {
            // 指定ノードが存在する場合にのみハイパーリンクを生成
            if(node !=null)
            {
                link.NavigateUrl = node.Url;
                link.Visible = true;
            }
        }
    }
}