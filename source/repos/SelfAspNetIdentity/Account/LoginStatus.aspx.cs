using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNetIdentity.Account
{
    public partial class LoginStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ls_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            // ログアウトを実行
            Context.GetOwinContext().Authentication.SignOut(
                DefaultAuthenticationTypes.ApplicationCookie); ;
        }
    }
}