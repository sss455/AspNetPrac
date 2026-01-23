using System;
using System.Data;
using System.Web.UI;

namespace SelfAspNet.Chap07
{
    public partial class DataCache : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ds = new DataSet();
            if (Cache.Get("Books") == null)
            {
                ds.ReadXml(Server.MapPath("~/App_Data/Books.xml"));
                Cache.Insert("Books", ds);
            }
            else
            {
                ds = (DataSet)Cache.Get("Books");
            }
            grid.DataSource = ds;
            Page.DataBind();
        }
    }
}