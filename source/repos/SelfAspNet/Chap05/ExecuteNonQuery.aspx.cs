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
    public partial class ExecuteNonQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // データベース接続情報を取得（Web.config）
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            // 接続の準備
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // SQL命令の準備
                var comm = new SqlCommand("UPDATE Book SET title = @title WHERE isbn = @isbn", db);
                comm.Parameters.AddWithValue("@title", "JavaScript逆引きレシピ　第2版");
                comm.Parameters.AddWithValue("@isbn", "978-4-7981-5757-3");

                // 接続の確立
                db.Open();
                // UPDATE命令を実行
                comm.ExecuteNonQuery();
                // 接続の切断
                db.Close();
            }
        }
    }
}