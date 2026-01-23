using SelfAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
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
