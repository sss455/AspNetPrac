using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap07
{
    public partial class DataCache2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dataSet = new DataSet();

            // キャッシュ"Books"の存在チェック
            if(Cache.Get("Books") == null)
            {
                // キャッシュが存在しない場合、新規読み込み＆キャッシュ生成
                dataSet.ReadXml(Server.MapPath("~/App_Data/Books.xml"));
                // キャッシュの依存関係を設定
                var cacheDependency = new CacheDependency(Server.MapPath("~/App_Data/Books.xml"));
                Cache.Insert("Books", dataSet, cacheDependency);
            }
            else
            {
                // キャッシュが存在する場合、その内容を取得
                dataSet = (DataSet)Cache.Get("Books");
            }

            // データセットをグリッド表にリバインド
            grid.DataSource = dataSet;
            Page.DataBind();
        }
    }
}