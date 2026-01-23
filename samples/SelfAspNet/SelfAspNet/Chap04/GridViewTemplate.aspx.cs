using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class GridViewTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (!Page.IsValid)
            {
                e.Cancel = true;
            }
            else
            {
                // 更新前の任意の処理
            }
        }

        protected void grid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Response.Write(e.Exception.Message);
            }
        }

        protected void grid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                var ltr = new Literal();
                ltr.Text = $"総ページ数：{grid.PageCount}";
                e.Row.Cells[e.Row.Cells.Count - 1].Wrap = false;
                e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(ltr);
            }
        }
    }
}