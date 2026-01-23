using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SelfAspNetIdentity.Models;
using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNetIdentity.Chap10
{
    [Designer(typeof(System.Web.UI.Design.ControlDesigner))]
    [DefaultProperty("ProfileName")]
    [ToolboxData("<{0}:ProfileLabel runat=server></{0}:ProfileLabel>")]
    public class ProfileLabel : Label
    {
        [Bindable(true)]
        [Category("Behavior")]
        [DefaultValue("")]
        [Localizable(true)]
        [Description("プロファイル名")]
        public string ProfileName
        {
            get
            {
                var s = (String)ViewState["ProfileName"];
                if (s == null)
                {
                    return String.Empty;
                }
                else
                {
                    return s;
                }
            }

            set
            {
                ViewState["ProfileName"] = value;
            }
        }

        [Browsable(false)]
        public override String Text
        {
            get
            {
                return "";
            }

            set
            {
                throw new NotSupportedException();
            }
        }

        protected override void RenderContents(HtmlTextWriter writer)
        {
            var cx = this.Context;
            if (cx != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = manager.FindByName(Context.User.Identity.Name);
                writer.Write(typeof(ApplicationUser).GetProperty(ProfileName).GetValue(user));
            }
            else
            {
                writer.Write(String.Format("[{0}]", this.ID));
            }
        }
    }
}
