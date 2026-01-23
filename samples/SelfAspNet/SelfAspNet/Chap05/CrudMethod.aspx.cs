using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using SelfAspNet.Models;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web.ModelBinding;

namespace SelfAspNet.Chap05
{
    public partial class CrudMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(DateTime.Now.ToString());
        }

        public IQueryable<Book> GetBooks()
        {
            var db = new SelfAsp();
            return from b in db.Book
                   orderby b.isbn
                   select b;
        }

        public IQueryable<Book> GetBooksByPrice([QueryString]int? price)
        //public IQueryable<Book> GetBooksByPrice([QueryString("p")]int? price)
        //public IQueryable<Book> GetBooksByPrice([Control("txtPrice")]int? price)
        //public IQueryable<Book> GetBooksByPrice([FriendlyUrlSegments(0)]int? price)
        {
            var db = new SelfAsp();
            if (price.HasValue)
            {
                return from b in db.Book
                       orderby b.isbn
                       where b.price >= price
                       select b;
            }
            else
            {
                return from b in db.Book
                       orderby b.isbn
                       select b;
            }
        }
        public void UpdateBook(Book b)
        {
            var db = new SelfAsp();
            if (ModelState.IsValid)
            {
                db.Entry(b).State = EntityState.Modified;
                db.SaveChanges();
            }
        }
    }
}