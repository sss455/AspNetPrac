using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace SelfAspNet.Chap09
{
    public class SqlSiteMapProvider : StaticSiteMapProvider
    {
        private String connectName;
        private SiteMapNode root;

        public override void Initialize(string name, NameValueCollection attributes)
        {
            if (connectName == null)
            {
                base.Initialize(name, attributes);
                connectName = attributes["connectName"];
            }
        }

        public override SiteMapNode BuildSiteMap()
        {
            if (root == null)
            {
                lock (this)
                {
                    this.CreateNode(root);
                }
            }
            return root;
        }

        protected override SiteMapNode GetRootNodeCore()
        {
            return this.BuildSiteMap();
        }

        private void CreateNode(SiteMapNode pnode)
        {
            ConnectionStringSettings setting =
                ConfigurationManager.ConnectionStrings[this.connectName];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                var comm = new SqlCommand("SELECT mid, url, title, description FROM Sitemap WHERE parent = @parent", db);
                comm.Parameters.AddWithValue("@parent", pnode == null ? 0 : Int32.Parse(pnode.Key));
                db.Open();
                var reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    if (pnode == null)
                    {
                        root = new SiteMapNode(this, reader["mid"].ToString(), reader["url"].ToString(), reader["title"].ToString(), reader["description"].ToString());
                        this.AddNode(root);
                        this.CreateNode(root);
                    }
                    else
                    {
                        var node = new SiteMapNode(this, reader["mid"].ToString(), reader["url"].ToString(), reader["title"].ToString(), reader["description"].ToString());
                        this.AddNode(node, pnode);
                        this.CreateNode(node);
                    }
                }
            }
        }
    }
}