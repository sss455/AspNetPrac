using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap04
{
    public partial class FormView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("GridViewBook.aspx");
            //Server.Transfer("GridViewBook.aspx");
            //Response.RedirectPermanent("https://wings.msn.to/");
            //fv.DefaultMode = FormViewMode.Insert;
        }

        protected void fv_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            if (Int32.Parse(e.NewValues["price"].ToString()) <= 0)
            {
                e.NewValues["price"] = e.OldValues["price"];
            }

            //var txtPrice = (TextBox)fv.FindControl("priceTextBox");
            //if (Int32.Parse(txtPrice.Text) <= 0)
            //{
            //    e.NewValues["price"] = e.OldValues["price"];
            //}
        }
    }
}