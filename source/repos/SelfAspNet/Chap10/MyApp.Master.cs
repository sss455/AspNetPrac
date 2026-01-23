using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class MyApp : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 現在のパスをurlパラメータに設定
            sds.SelectParameters.Clear();
            sds.SelectParameters.Add("url", Request.AppRelativeCurrentExecutionFilePath);

            // SiteMapテーブルからデータ取得
            var reader = (IDataReader) sds.Select(DataSourceSelectArguments.Empty);
            // SELECT title, keywd, description FROM Sitemap WHERE (url = @url)

            // 取得できた場合
            if ( reader.Read() )
            {
                // 現在のページのタイトル／キーワード／説明をページに反映
                Page.Header.Title       = reader["title"].ToString();
                Page.Header.Keywords    = reader["keywd"].ToString();
                Page.Header.Description = reader["description"].ToString();
            }

        }
    }
}