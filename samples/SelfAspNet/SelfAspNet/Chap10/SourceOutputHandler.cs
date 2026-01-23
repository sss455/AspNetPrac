using System;
using System.Web;
using System.IO;
using System.Text;

namespace SelfAspNet.Chap10
{
    public class SourceOutputHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            var orgPath = context.Request.PhysicalPath;
            var file = Path.GetFileNameWithoutExtension(orgPath);
            var srcPath = Path.Combine(Path.GetDirectoryName(orgPath), file);
            using (var reader = new StreamReader(srcPath, Encoding.UTF8))
            {
                var Response = context.Response;
                Response.Write("<html>");
                Response.Write($"<head><title>{file}</title></head>");
                Response.Write("<body>");
                Response.Write($"<h1>{file}</h1>");
                Response.Write("<table border='0'>");
                var cnt = 1;
                while (reader.Peek() > -1)
                {
                    Response.Write("<tr>");
                    Response.Write($"<th align='right'>{cnt}</th>");
                    var line = context.Server.HtmlEncode(reader.ReadLine());
                    Response.Write($"<td>{line.Replace(" ", "&nbsp;")}</td></tr>");
                    cnt++;
                }
                Response.Write("</body>");
                Response.Write("</html>");
            }
        }
    }
}
