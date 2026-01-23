using System;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public class Album
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet GetAlbumData(String category)
        {
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            var db = new SqlConnection(setting.ConnectionString);
            var comm = new SqlCommand();
            comm.Connection = db;
            if (category == "無選択")
            {
                comm.CommandText = "SELECT [aid], [comment], [updated], [favorite], [category] FROM [Album]";
            }
            else
            {
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album WHERE category = @category";
                comm.Parameters.AddWithValue("@category", category);
            }
            var ds = new DataSet();
            var adapter = new SqlDataAdapter(comm);
            adapter.Fill(ds, "Album");
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public int DeleteAlbumData(String aid)
        {
            int result;
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("DELETE FROM Album WHERE aid = @aid", db);
                comm.Parameters.AddWithValue("@aid", aid);
                db.Open();
                result = comm.ExecuteNonQuery();
            }
            return result;
        }
    }
}