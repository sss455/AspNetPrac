using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public partial class ExecuteNonQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("UPDATE Book SET title = @title WHERE isbn = @isbn", db);
                comm.Parameters.AddWithValue("@title", "JavaScript逆引きレシピ 第2版");
                comm.Parameters.AddWithValue("@isbn", "978-4-7981-5757-3");
                db.Open();
                comm.ExecuteNonQuery();
                db.Close();
            }
        }
    }
}