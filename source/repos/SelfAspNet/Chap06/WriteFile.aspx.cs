using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap06
{
    public partial class WriteFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // コンテンツタイプをJPEG画像に設定
            Response.ContentType = "image/jpeg";
            Response.WriteFile(Server.MapPath("~/Image/A0001.jpg"));

            // 出力を終了
            Response.End();
        }
    }
}