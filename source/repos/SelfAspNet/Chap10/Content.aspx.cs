using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class Content : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* コンテンツページから、マスターページの内容を動的に変更する */

            // 現在のページに関連付けられたマスターページのMasterPageオブジェクトを取得
            MasterPage mst = Page.Master;

            // FindControlメソッドを使用して、マスターページ上のImageコントロールを取得して画像URLを変更
            var img = (Image) mst.FindControl("img");
            img.ImageUrl = "http://www.web-deli.com/image/logo.gif";
        }
    }
}