using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SelfAspNetIdentity.Models;

namespace SelfAspNetIdentity.Account
{
    public partial class Register : Page
    {
        /// <summary>
        ///  登録ボタン押下時
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // ApplicationUserManagerオブジェクトを取得
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            // ApplicationSignInManagerオブジェクトを取得
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            // ユーザー情報を生成
            var user = new ApplicationUser() { UserName = Email.Text, 
                                                  Email = Email.Text,
                                                    // p.409 [Add] プロファイル情報にURLを追加
                                                    Url = Url.Text
                                             };
            // ユーザー情報を登録
            IdentityResult result = manager.Create(user, Password.Text);

            // 登録成功時には、そのまま自動的にログイン処理
            if (result.Succeeded)
            {
                // アカウント確認とパスワード リセットを有効にする方法の詳細については、https://go.microsoft.com/fwlink/?LinkID=320771 を参照してください
                // string code = manager.GenerateEmailConfirmationToken(user.Id);
                // string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                // manager.SendEmail(user.Id, "アカウントの確認", "このリンクをクリックすることによってアカウントを確認してください <a href=\"" + callbackUrl + "\">こちら</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            // 登録失敗時には、エラー情報を表示
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}