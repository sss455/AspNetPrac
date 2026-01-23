using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class NonAccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // データベース接続情報を取得（Web.config）
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            // 接続文字列とSELECT命令を定義したデータアダプターを生成
            var adapter = new SqlDataAdapter(
                "SELECT * FROM Book WHERE publish = @publish",
                setting.ConnectionString);
            adapter.SelectCommand.Parameters.AddWithValue("@publish", "翔泳社");

            var dataSet = new DataSet();
            // データアダプターを使用してデータセットにデータを流し込み
            adapter.Fill(dataSet, "Book");

            // データセットの内容を読み込み＆出力
            for(var i = 0; i < dataSet.Tables["Book"].Rows.Count; i++)
            {
                Response.Write($"{dataSet.Tables["Book"].Rows[i]["title"]}<br />");
            }
        }
    }
}