using System;
using System.Data;
using System.Web.UI;

namespace SelfAspNet.Chap06
{
    public partial class ContentType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var reader = (IDataReader)sds.Select(
                DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                Response.ContentType = reader["type"].ToString();
                Response.BinaryWrite((byte[])reader["data"]);
            }
            else
            {
                Response.StatusCode = 404;
                Response.Write("ページが見つかりませんでした");
            }
            Response.End();
        }
    }
}