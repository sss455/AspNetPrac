using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class UpdateProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 現在時刻を設定（部分更新の確認用）
            lblCurrent.Text = DateTime.Now.ToString();

            // 処理を3秒だけ休止
            System.Threading.Thread.Sleep(3000);

            // UpdatePanelコントロールによる部分更新では処理が自動では行われないので、明示的にデータバインドを指示する必要がある。
            // ※この記述が無い場合、GridViewコントロールの内容は更新されない。
            grid.DataBind();
        }
    }
}