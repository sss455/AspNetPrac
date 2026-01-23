using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SelfAspNet.Chap09
{
    public class SqlSiteMapProvider : StaticSiteMapProvider
    {
        // Web.configで定義された接続文字列
        private String connectName;

        // データベースで定義されたサイトマップ情報
        private SiteMapNode root;

        //  サイトマップ情報の読み込みに必要なリソースを初期化
        public override void Initialize(string name, NameValueCollection attributes)
        {
            // 変数connectNameが空である場合、Web.configの情報を読み込み
            if(this.connectName  == null)
            {
                base.Initialize(name, attributes);
                this.connectName = attributes["connectName"];
            }
        }

        // データソースからの読み込み結果をSiteMapNodeオブジェクトとして組み立て
        public override SiteMapNode BuildSiteMap()
        {
            if (this.root == null)
            {
                lock (this)
                {
                    this.CreateNode(this.root);
                }
            }
            return this.root;
        }

        // ルートノードを取得（BuildSiteMapメソッドの同じ値を返せばOK）
        protected override SiteMapNode GetRootNodeCore()
        {
            return this.BuildSiteMap();
        }

        // 指定ノード（pnode）を親とするノード郡を子ノードとして追加
        private void CreateNode(SiteMapNode pnode)
        {
            ConnectionStringSettings setting = ConfigurationManager.ConnectionStrings[this.connectName];

            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // 引数parentをキーに、Sitemapテーブルを検索（子ノードを取得）
                var comm = new SqlCommand("SELECT mid, url, title, description FROM Sitemap WHERE parent = @parent", db);
                comm.Parameters.AddWithValue("@parent", (pnode == null ? 0 : Int32.Parse(pnode.Key)) );

                // DBオープン
                db.Open();

                // SELECT命令を実行
                var reader = comm.ExecuteReader();

                // 取得した子ノードを、順に親ノード（pnode）に追加
                while (reader.Read())
                {
                    if (pnode == null)
                    {
                        root = new SiteMapNode(
                                      this,
                                      reader["mid"].ToString(),
                                      reader["url"].ToString(),
                                      reader["title"].ToString(),
                                      reader["description"].ToString()
                                  );
                        this.AddNode(root);
                        this.CreateNode(root);
                    }
                    else
                    {
                        var node = new SiteMapNode(
                                      this,
                                      reader["mid"].ToString(),
                                      reader["url"].ToString(),
                                      reader["title"].ToString(),
                                      reader["description"].ToString()
                                  );
                        this.AddNode(node, pnode);
                        this.CreateNode(node);
                    }
                }

            }
        }
    }
}