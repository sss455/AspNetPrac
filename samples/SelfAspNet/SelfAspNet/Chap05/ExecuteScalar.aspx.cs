using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public partial class ExecuteScalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("SELECT COUNT(*) FROM Book", db);
                db.Open();
                Response.Write($"登録数：{comm.ExecuteScalar()}");
                db.Close();
            }
        }
    }
}