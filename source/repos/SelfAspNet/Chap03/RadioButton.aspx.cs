using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class RadioButton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void list_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRsult.Text = $"「{list.SelectedValue}」が選択されました。";
            // lblRsult.Text = $"「{list.Items[list.SelectedIndex]}」が選択されました。";
            // lblRsult.Text = $"「{list.SelectedItem.Value}」が選択されました。";
        }
    }
}