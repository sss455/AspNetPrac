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
    public partial class ExecuteScalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // データベース接続情報を取得（Web.config）
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            // 接続の準備
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // SQL命令の準備
                var comm = new SqlCommand("SELECT COUNT(*) FROM Book", db);
 
                // 接続の確立
                db.Open();
                // SELECT文でも返される値が単一の値であることが分かっている場合、ExecuteScalarメソッドを利用すると便利
                Response.Write($"登録数：{comm.ExecuteScalar()}");  // 結果：7
                // 接続の切断
                db.Close();
            }
        }
    }
}