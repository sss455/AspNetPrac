using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class GridViewTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if(!Page.IsValid)
            {
                e.Cancel = true;
            } 
            else
            {
                // 更新前の任意の処理
            }
        }
        protected void grid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Response.Write(e.Exception.Message);
            }
        }

        protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //-------------------------------------------------------
            // 行タイプがフッター行の場合
            //-------------------------------------------------------
            // ・GridViewRowEventArgs.Row.RowType ＝ 現在行の種類
            // ・DataControlRowType列挙体
            //      DataRow       ：データ行
            //      Footer        ：フッター行
            //      Header        ：ヘッダー行
            //      EmptyDataRoo  ：空行（レコードが存在しない場合に出力）
            //      Pager         ：ページャー
            //      Separator     ：区切り行
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Literalコントロールを生成
                var ltr = new Literal();

                // GridView.PageCountプロパティ ＝ ページの総数
                ltr.Text = $"総ページ数：{grid.PageCount}";

                // テキストを折り返さない
                e.Row.Cells[e.Row.Cells.Count - 1].Wrap = false;
                // Literalコントロールをセルに追加
                e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(ltr);

                // ・GridViewRow.Cellsプロパティ         ：現在行のセル郡（TableCellCollectionオブジェクト）
                // ・TableCellCollection.Countプロパティ ：セル数
                // 　よって、「e.Row.Cells[e.Row.Cells.Count - 1]」で現在行の末尾のセルを取得（TableCellオブジェクト）
                // ・TableCell.Wrapプロパティ            ：セル配下のテキストを折り返すかどうか
                // ・TableCell.Controlsプロパティ        ：セル配下に配置されたすべてのコントロール郡（ControlCollectionオブジェクト）
                // ・ControlCollection.Addメソッド    　 ：Literalコントロールをセルに追加
            }
        }
    }
}