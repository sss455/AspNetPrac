using System;
using System.Transactions;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap05
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (var ts = new TransactionScope())
            {
                var adapter = new AlbumDataSetTableAdapters.AlbumTableAdapter();
                adapter.Delete(e.Keys["aid"].ToString());
                int result = adapter.InsertHistory(e.Keys["aid"].ToString(), e.Values["comment"].ToString());
                if (result > 0)
                {
                    ts.Complete();
                }
            }
            e.Cancel = true;
            grid.DataBind();

        }
    }
}