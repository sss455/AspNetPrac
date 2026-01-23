using System;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap09
{
    public partial class Wizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void wiz_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (!Page.IsValid)
            {
                e.Cancel = true;
            }
        }

        protected void wiz_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (Page.IsValid)
            {
                //sds.InsertParameters.Clear();
                //sds.InsertParameters.Add("name", txtName.Text);
                //sds.InsertParameters.Add("email", txtEmail.Text);
                //sds.InsertParameters.Add("purpose", ddlPurpose.SelectedValue);
                //sds.InsertParameters.Add("evaluate", rdoEvaluate.SelectedValue);
                //sds.InsertParameters.Add("free", txtFree.Text);
                //sds.InsertParameters.Add("mail", chkMail.Checked.ToString());
                sds.Insert();
            }
            else
            {
                e.Cancel = true;
            }
        }

        protected void sds_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@name"].Value = txtName.Text;
            e.Command.Parameters["@email"].Value = txtEmail.Text;
            e.Command.Parameters["@purpose"].Value = ddlPurpose.SelectedValue;
            e.Command.Parameters["@evaluate"].Value = rdoEvaluate.SelectedValue;
            e.Command.Parameters["@free"].Value = txtFree.Text;
            e.Command.Parameters["@mail"].Value = chkMail.Checked;
        }

        protected void sds_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                ltrResult.Text = "エラーが発生しました。";
                var mail = new MailMessage("XXXXX@example.com",
                    "webmaster@example.com", "エラー発生通知", e.Exception.Message);
                var cli = new SmtpClient();
                cli.Send(mail);
            }
        }
    }
}