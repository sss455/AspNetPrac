using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SelfAspNet.Chap05.AlbumDataSetTableAdapters
{
    /// <summary>
    ///  作成した型付きデータセット（AlbumDataSet.xsd）から自動生成されたテーブルアダプターを拡張した部分クラス（パーシャルクラス）
    /// </summary>
    public partial class AlbumTableAdapter
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
            if (category == "無選択")
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

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public SelfAspNet.Chap05.AlbumDataSet.AlbumDataTable GetAlbumPaging(int startRowIndex, int maximumRows)
        {
            // m～n件のレコードを取得するためのSELECT命令を定義
            SqlCommand comm = this.Connection.CreateCommand();
            comm.CommandText = 
                "SELECT aid, comment, updated, favorite, category FROM Album ORDER BY updated DESC " +
                  $"OFFSET {startRowIndex} ROWS FETCH NEXT {maximumRows} ROWS ONLY";

            this.Adapter.SelectCommand = comm;

            // SELECT命令を実行して、型付きデータセットに結果を流し込み
            AlbumDataSet albumDataSet = new AlbumDataSet();
            this.Adapter.Fill(albumDataSet, "Album");

            return albumDataSet.Album;
        }
    }
}