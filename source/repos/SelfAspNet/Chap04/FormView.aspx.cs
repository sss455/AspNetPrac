using System;
using System.Collections.Generic;
using System.Configuration;
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

        /**
         * p.182 Add
         * 更新処理後に画面を移動する。
         */
        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("GridViewTemplate.aspx");

            // 新規フォームに移動
            //FormView1.DefaultMode = FormViewMode.Insert;
        }

        /**
         * p.183 Add
         * 実行時にパラメータ―を引き渡す
         */
        protected void fv_ItemUpdating(object sender,FormViewUpdateEventArgs e)
        {
            if (Int32.Parse(e.NewValues["price"].ToString()) <= 0)
            {
                e.NewValues["price"] = e.OldValues["price"];
            }

            // [別解]
            //var txtPrice = (TextBox)FormView1.FindControl("priceTextBox");
            //if (Int32.Parse(txtPrice.Text) <= 0)
            //{
            //    e.NewValues["price"] = e.OldValues["price"];
            //    //txtPrice.Text = e.OldValues["price"].ToString();  // ×
            //}
        }
    }
}