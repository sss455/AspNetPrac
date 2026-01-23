using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SelfAspNetIdentity.Startup))]
namespace SelfAspNetIdentity
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
