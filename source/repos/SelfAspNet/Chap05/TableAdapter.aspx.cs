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
            var dataSet =new AlbumDataSet();

            adapter.Fill(dataSet.Album);

            for(int i = 0; i < dataSet.Album.Rows.Count; i++)
            {
                Response.Write($"{dataSet.Album[i].aid}");
                //Response.Write($"{ds.Tables["Album"].Rows[i]["aid"]}<br />");
            }
        }
    }
}