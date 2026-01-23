using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class ExecuteReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // データベース接続情報を取得（Web.config）
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            // 接続の準備
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // SQL命令の準備
                var comm = new SqlCommand("SELECT * FROM Book WHERE publish = @publish", db);
                comm.Parameters.AddWithValue("@publish", "翔泳社");

                // 接続の確立
                db.Open();
                // SQL命令を実行
                var reader = comm.ExecuteReader();
                // その結果（書籍タイトル）を表示
                while (reader.Read())
                {
                    Response.Write($"{reader["title"]}<br />");
                }
                // 接続の切断
                db.Close();
            }
        }
    }
}