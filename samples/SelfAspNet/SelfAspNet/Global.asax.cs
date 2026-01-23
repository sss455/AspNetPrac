using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace SelfAspNet
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null,
            new ScriptResourceDefinition()
            {
                Path = "~/Scripts/jquery-3.4.1.min.js",
                DebugPath = "~/Scripts/jquery-3.4.1.js",
                CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.min.js",
                CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.js"
            });

            //RouteTable.Routes.MapPageRoute("blog",
            //    "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx");

            //RouteTable.Routes.MapPageRoute("blog",
            //    "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx",
            //    false,
            //    new RouteValueDictionary(new
            //    {
            //        year = DateTime.Now.Year,
            //        month = DateTime.Now.Month,
            //        day = DateTime.Now.Day
            //    }));

            RouteTable.Routes.MapPageRoute("blog",
                "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx",
                false,
                new RouteValueDictionary(new
                {
                    year = DateTime.Now.Year,
                    month = DateTime.Now.Month,
                    day = DateTime.Now.Day
                }),
                new RouteValueDictionary(new
                {
                    year = @"\d{4}",
                    month = @"\d{1,2}",
                    day = @"\d{1,2}"
                }));

            RouteTable.Routes.EnableFriendlyUrls();
        }

        //protected void Application_EndRequest(object sender, EventArgs e)
        //{
        //    var req = Context.Request;
        //    var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
        //    using (var db = new SqlConnection(setting.ConnectionString))
        //    {
        //        var comm = new SqlCommand("INSERT INTO AccessLog(url, userAgent, referrer, accessTime) VALUES(@url, @userAgent, @referrer, @accessTime)", db);
        //        comm.Parameters.AddWithValue("@url", req.Url.ToString());
        //        comm.Parameters.AddWithValue("@userAgent", req.UserAgent);
        //        comm.Parameters.AddWithValue("@referrer", req.UrlReferrer != null ? req.UrlReferrer.ToString() : "");
        //        comm.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString());
        //        db.Open();
        //        comm.ExecuteNonQuery();
        //    }
        //}

        protected void Application_Error(object sender, EventArgs e)
        {
            using (var writer = new StreamWriter(Server.MapPath("~/App_Data/error.log"), true, Encoding.GetEncoding("Shift_JIS")))
            {
                var err = Server.GetLastError().InnerException;
                if (err != null)
                {
                    var builder = new StringBuilder();
                    builder.Append(err.Source);
                    builder.Append("\t");
                    builder.Append(err.Message);
                    builder.Append("\t");
                    builder.Append(DateTime.Now.ToString());
                    writer.WriteLine(builder.ToString());
                }
            }
        }

    }
}