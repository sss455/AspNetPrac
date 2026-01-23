using SelfAspNet.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap05
{
    public partial class CrudMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // すべての書籍情報を取得
        //public IQueryable<Book> GetBooks()
        //{
        //    // コンテキストオブジェクトを生成（Models/SelfAsp.cs）
        //    var db = new SelfAsp();
        //
        //        return
        //            from b in db.Book   // データソース(db.Book）がBookエンティティの集合を表す。b(範囲変数)は個別のBookエンティティを表す。
        //            orderby b.isbn
        //            select b;
        //}


        // 「～CrudMethod.aspx?price=xxxxx」とクエリ情報を付与することで、書籍情報を価格でフィルタリングする。
        //
        // [QueryString]属性：SELECTメソッドの実行時に、引数priceに同名の栗情報（QueryString）priceの値を割当なさい、という意味。
        //                    ※クエリ情報の解釈から値の型変換までをモデルバインディングが自動で行うので、値の引き渡しをほとんど意識せずに済む。
        public IQueryable<Book> GetBooksByPrice([QueryString]int? price)
        //public IQueryable<Book> GetBooksByPrice([QueryString("p")] int? price)     // 「～CrudMethod.aspx?p=3000」のように絞り込み条件を指定する場合。
        //public IQueryable<Book> GetBooksByPrice([Control("txtPrice")] int? price)  // テキストボックスtxtPriceで入力された値をもとに絞り込みたい場合。
        {
            // コンテキストオブジェクトを生成（Models/SelfAsp.cs）
            var db = new SelfAsp();

            // 引数priceが空でなければ、その値でデータをフィルタリング
            if(price.HasValue)
            {
                return
                    from b in db.Book   // データソース(db.Book）がBookエンティティの集合を表す。b(範囲変数)は個別のBookエンティティを表す。
                    orderby b.isbn
                    where b.price >= price
                    select b;

            }
            // クエリ情報の指定がない場合、
            // もしくはクエリ情報が数値として解釈できない場合、すべての書籍情報を取得
            else
            {
                return
                    from b in db.Book
                    orderby b.isbn
                    select b;
            }
        }

        public void UpdateBook(Book b)
        {
            /*   ※引数「Book b」は、入力値をオブジェクトに自動的にバインドされている。 */

            // コンテキストオブジェクトを生成（Models/SelfAsp.cs）
            var db = new SelfAsp();

            // 検証した結果、検証エラーが一つもなかった場合
            // ※検証ルールは、自動生成したデータモデル（Models/Book.cs）で定義
            if (ModelState.IsValid)
            {
                // EntityFrameworkのSaveChange()の例外発生時に、SQLExceptionのエラーメッセージを表示させる
                //db.Configuration.ValidateOnSaveEnabled = false;

                // 現在のモデルの状態が変更されたことを、Entity Frameworkに対して通知
                db.Entry(b).State = EntityState.Modified;

                // 変更されたモデルをデータベースに保存
                db.SaveChanges();
            }
        }

        protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //TextBox t = (TextBox)grid.Rows[e.NewEditIndex].Cells[5].Controls[0];
            //t.Text = "";
        }
    }
}