using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class Custom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cusName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value.Length <= 20);
        }
    }
}