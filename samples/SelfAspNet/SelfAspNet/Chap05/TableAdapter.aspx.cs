using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap05
{
    public partial class TableAdapter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var adapter = new AlbumDataSetTableAdapters.AlbumTableAdapter();
            var ds = new AlbumDataSet();
            adapter.Fill(ds.Album);
            for (int i = 0; i < ds.Album.Rows.Count; i++)
            {
                Response.Write($"{ds.Album[i].aid}<br />");
                //Response.Write($"{ds.Tables["Album"].Rows[i]["aid"]}<br />");
            }
        }
    }
}