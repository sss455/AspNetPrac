using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SelfAspNetIdentity.Models;

namespace SelfAspNetIdentity.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // パスワードの再設定機能についてアカウントの確認を有効にしてから、この設定を有効にしてください
            // ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        /// <summary>
        ///  ログインボタン押下時
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LogIn(object sender, EventArgs e)
        {
            // 入力値にエラーがない場合、ログイン処理
            if (IsValid)
            {
                // ユーザーのパスワードを検証します
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // ユーザー名／パスワードでログインを実行
                // 　ここではアカウントのロックアウトを目的としてログイン エラーが考慮されません
                // 　パスワード エラーによってロックアウトが実行されるようにするには、shouldLockout: true に変更します
                var result = signinManager.PasswordSignIn(
                                               Email.Text,
                                               Password.Text,
                                               RememberMe.Checked,
                                               shouldLockout: true);
                                            // shouldLockout: false);

                // 結果に基づいて処理を分岐
                switch (result)
                {
                    // 成功した場合は要求されたページにリダイレクト
                    case SignInStatus.Success:
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;

                    // アカウントがロックされた場合
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;

                    // 2段階認証が必要な場合
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    // それ以外の結果ではエラーメッセージを表示
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "無効なログインです";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
    }
}