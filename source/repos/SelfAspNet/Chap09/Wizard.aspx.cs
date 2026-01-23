using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class Wizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Wizardコントロールで[次へ]ボタンがクリックされたときに実行
        protected void wiz_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if( !Page.IsValid )
            {
                // 検証失敗時には処理をキャンセル
                e.Cancel = true;
            }
        }

        // Wizardコントロール上で[完了]ボタンがクリックされたときに実行
        protected void wiz_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if ( Page.IsValid )
            {
                // 検証成功時に挿入処理を実行
                sds.Insert();
            }
            else
            {
                // 検証失敗時には処理をキャンセル
                e.Cancel = true;
            }

        }

        // SqlDataSourceコントロールによる挿入処理が実行される前に実行
        protected void sds_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            // 挿入コマンドに必要なパラメーターを設定
            e.Command.Parameters["@name"].Value = txtName.Text;                     // 氏名
            e.Command.Parameters["@email"].Value = txtEmail.Text;                   // E-Mailアドレス
            e.Command.Parameters["@purpose"].Value = ddlPurpose.SelectedValue;      // 本書購入の目的
            e.Command.Parameters["@evaluate"].Value = rdoEvaluate.SelectedValue;    // 本書の評価
            e.Command.Parameters["@free"].Value = txtFree.Text;                     // 自由感想
            e.Command.Parameters["@mail"].Value = chkMail.Checked;                  // メールニュースの受信希望（Yes｜No）

        }

        // SqlDataSourceコントロールによる挿入処理が実行された後に実行
        protected void sds_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            // エラー発生時にメッセージ表示＆メール送信
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ltrResult.Text = "エラーが発生しました。";

                // メール送信
                var mail = new MailMessage("XXXXX@example.com", "webmaster@example.com", "エラー発生通知", e.Exception.Message);
                var cli = new SmtpClient();
                cli.Send(mail);

            }
        }
    }
}