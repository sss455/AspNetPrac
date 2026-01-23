using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public partial class ExecuteReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("SELECT * FROM Book WHERE publish = @publish", db);
                comm.Parameters.AddWithValue("@publish", "翔泳社");
                db.Open();
                var reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    Response.Write($"{reader["title"]}<br />");
                }
                db.Close();
            }
        }
    }
}