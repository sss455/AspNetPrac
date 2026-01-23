using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public partial class ChartParts : System.Web.UI.UserControl
    {
        public String Brand
        {
            get
            {
                return sds.SelectParameters["brand"].DefaultValue;
            }

            set
            {
                sds.SelectParameters["brand"].DefaultValue = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}