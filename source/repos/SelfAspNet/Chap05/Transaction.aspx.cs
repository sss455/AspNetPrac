using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap05
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // トランザクションスコープ
            using(var tran = new TransactionScope())
            {
                var adapter = new AlbumDataSetTableAdapters.AlbumTableAdapter();

                // 対象aidのAlbumデータを[削除]
                adapter.Delete(e.Keys["aid"].ToString());

                // 削除したAlbumデータをAlbumHistoryに[登録]
                int result = adapter.InsertHistory(e.Keys["aid"].ToString(), e.Values["comment"].ToString());

                if(result > 0)
                {
                    // コミット
                    tran.Complete();
                }
            }

            // 本来のデータメソッドで定義された処理はキャンセル
            e.Cancel = true;
            // グリッド表にデータをバインドし直す
            grid.DataBind();
        }
    }
}