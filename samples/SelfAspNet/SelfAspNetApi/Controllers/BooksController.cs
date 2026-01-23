using SelfAspNetApi.Models;
using System.Net;
using System.Web.Http;

namespace SelfAspNetApi.Controllers
{
    public class BooksController : ApiController
    {
        public Book GetBook(string id)
        {
            var db = new SelfAsp();
            var book = db.Book.Find(id);
            if (book == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return book;
        }
    }
}
