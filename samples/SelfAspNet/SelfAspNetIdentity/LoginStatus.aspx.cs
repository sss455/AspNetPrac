using Microsoft.AspNet.Identity;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace SelfAspNetIdentity
{
    public partial class LoginStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ls_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }
}