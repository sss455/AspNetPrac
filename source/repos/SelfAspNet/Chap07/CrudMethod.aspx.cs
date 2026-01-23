using SelfAspNet.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap07
{
    public partial class CrudMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ページの先頭に現在時刻を表示
            Response.Write(DateTime.Now.ToString());
        }

        public IQueryable<Book> GetBooksByPrice([QueryString]int? price)
        //public IQueryable<Book> GetBooksByPrice([QueryString("p")] int? price)
        //public IQueryable<Book> GetBooksByPrice([Control("txtPrice")] int? price)
        {
            var db = new SelfAsp();

            // 引数priceが空でなければ、その値でデータをフィルタリング
            if(price.HasValue)
            {
                return
                    from b in db.Book
                    orderby b.isbn
                    where b.price >= price
                    select b;

            }
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

            var db = new SelfAsp();

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
    }
}