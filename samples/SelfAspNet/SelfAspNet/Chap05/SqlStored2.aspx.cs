using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap05
{
    public partial class SqlStored2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sds_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblNum.Text = e.Command.Parameters["@RETURN_VALUE"].Value.ToString();
        }
    }
}