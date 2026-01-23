using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SelfAspNet.Chap05
{
    /// <summary>
    ///  自作のデータアクセスコンポーネント
    /// </summary>
    public class Album
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet GetAlbumData(String category)
        {
            // データベース接続の準備
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            var db = new SqlConnection(setting.ConnectionString);

            // 取得コマンドの準備
            var comm = new SqlCommand();
            comm.Connection = db;

            // 引数categoryの値によってSQL命令を振り分け
            if(category == "無選択")
            {
                comm.CommandText = "SELECT [aid], [comment], [updated], [favorite], [category] FROM [Album]";
            }
            else
            {
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album WHERE category = @category";
                comm.Parameters.AddWithValue("@category", category);
            }

            // データセットの生成＆取得コマンドの実行
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter(comm);
            adapter.Fill(dataSet, "Album");

            return dataSet;
        }

        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public int DeleteAlbumData(String aid)
        {
            int result;

            // データベース接続の準備
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];

            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // 削除コマンドの準備
                var comm = new SqlCommand("DELETE FROM Album WHERE aid = @aid", db);
                comm.Parameters.AddWithValue("@aid", aid);

                // 接続の確立
                db.Open();
                result = comm.ExecuteNonQuery();
            }

            // 削除件数
            return result;
        }
    }
}