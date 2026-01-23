using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using SelfAspNetIdentity.Models;

namespace SelfAspNetIdentity
{
    public class EmailService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // 電子メールを送信するには、電子メール サービスをここにプラグインします。
            return Task.FromResult(0);
        }
    }

    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // テキスト メッセージを送信するには、SMS サービスをここにプラグインします。
            return Task.FromResult(0);
        }
    }

    /// <summary>
    /// このアプリケーションで使用されるアプリケーション ユーザー マネージャーを設定します。<br/>
    /// UserManager は ASP.NET Identity の中で定義されており、このアプリケーションで使用されます。
    /// </summary>
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser> store)
            : base(store)
        {
        }

        /// <summary>
        /// ApplicationuserManagerオブジェクトを生成する。<br/>
        /// メソッド配下では、「ユーザー名／パスワードの検証ルール」、「メール／ショートメッセージの送信方法」など、ユーザー管理に関わる基本プロパティを設定。
        /// </summary>
        /// <param name="options"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
        {
            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>()));

            //------------------------------------------------------------------
            // ユーザー名の検証ルールを設定
            //------------------------------------------------------------------
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                // 数字とアルファベットだけを許可するか
                AllowOnlyAlphanumericUserNames = false,
                // メールアドレスが一意であるべきか
                RequireUniqueEmail = true
            };

            //------------------------------------------------------------------
            // パスワードの検証ルールを設定
            //------------------------------------------------------------------
            manager.PasswordValidator = new PasswordValidator
            {
                // 最小の文字数
                RequiredLength = 6,
                // 数字とアルファベット以外の文字が必要か
                RequireNonLetterOrDigit = true,
                // 数字が必要か
                RequireDigit = true,
                // アルファベット（小文字）が必要か
                RequireLowercase = true,
                // アルファベット（大文字）が必要か
                RequireUppercase = true,
            };

            //------------------------------------------------------------------
            // 2要素認証プロバイダーを登録します。
            // このアプリケーションでは、電話とメールをユーザー確認用コード受け取りのステップとして使用します
            // 独自のプロバイダーを作成して、ここにプラグインすることができます。
            //------------------------------------------------------------------
            manager.RegisterTwoFactorProvider("電話コード", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "あなたのセキュリティ コードは {0} です。"
            });
            manager.RegisterTwoFactorProvider("電子メール コード", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "セキュリティ コード",
                BodyFormat = "あなたのセキュリティ コードは {0} です。"
            });

            //------------------------------------------------------------------
            // ユーザー ロックアウトの既定値を設定
            //------------------------------------------------------------------
            // ロックアウト機能を有効にするか
            manager.UserLockoutEnabledByDefault = true;
            // 試行回数をカウントする時間間隔（5分）
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            // ロックアウトまでの試行回数（5回）
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            manager.EmailService = new EmailService();
            manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
    }

    /// <summary>
    ///  p.411 [Add] ロールを管理するためのクラス。（ユーザー管理のためのApplicationUserManagerクラスに相当。）
    /// </summary>
    public class ApplicationRoleManager : RoleManager<ApplicationRole, string>
    {
        // コンストラクター
        public ApplicationRoleManager(IRoleStore<ApplicationRole, string> store) : base(store)
        {
        }
        /// <summary>
        ///  ApplicationroleManagerオブジェクトを生成する。
        /// </summary>
        /// <param name="options"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            var manager = new ApplicationRoleManager(new RoleStore<ApplicationRole>(context.Get<ApplicationDbContext>()));

            // adminロールがなければ新規に生成
            if(!manager.RoleExists("Admin"))
            {
                manager.Create(new ApplicationRole { Name = "Admin" });
            }

            return manager;
        }
    }

    public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
    {
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager) :
            base(userManager, authenticationManager) { }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(ApplicationUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }
    }
}
