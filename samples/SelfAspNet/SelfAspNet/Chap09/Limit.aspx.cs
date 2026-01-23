using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class Limit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var nodCur = SiteMap.CurrentNode;
            if (nodCur != null)
            {
                var nodPrev = nodCur.PreviousSibling;
                var nodParent = nodCur.ParentNode;
                var nodNext = nodCur.NextSibling;
                this.SetHyperLink(lnkPrev, nodPrev);
                this.SetHyperLink(lnkParent, nodParent);
                this.SetHyperLink(lnkNext, nodNext);
            }
        }

        private void SetHyperLink(HyperLink link, SiteMapNode node)
        {
            if (node != null)
            {
                link.NavigateUrl = node.Url;
                link.Visible = true;
            }
        }
    }
}