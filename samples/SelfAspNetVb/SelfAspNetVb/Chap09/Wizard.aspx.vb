Imports System.Net.Mail

Public Class Wizard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub wiz_NextButtonClick(sender As Object, e As WizardNavigationEventArgs) Handles wiz.NextButtonClick
        If Not Page.IsValid Then
            e.Cancel = True
        End If
    End Sub

    Protected Sub wiz_FinishButtonClick(sender As Object, e As WizardNavigationEventArgs) Handles wiz.FinishButtonClick
        If Page.IsValid Then
            'sds.InsertParameters.Clear()
            'sds.InsertParameters.Add("name", txtName.Text)
            'sds.InsertParameters.Add("email", txtEmail.Text)
            'sds.InsertParameters.Add("purpose", ddlPurpose.SelectedValue)
            'sds.InsertParameters.Add("evaluate", rdoEvaluate.SelectedValue)
            'sds.InsertParameters.Add("free", txtFree.Text)
            'sds.InsertParameters.Add("mail", chkMail.Checked)
            sds.Insert()
        Else
            e.Cancel = True
        End If
    End Sub

    Protected Sub sds_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles sds.Inserting
        e.Command.Parameters("@name").Value = txtName.Text
        e.Command.Parameters("@email").Value = txtEmail.Text
        e.Command.Parameters("@purpose").Value = ddlPurpose.SelectedValue
        e.Command.Parameters("@evaluate").Value = rdoEvaluate.SelectedValue
        e.Command.Parameters("@free").Value = txtFree.Text
        e.Command.Parameters("@mail").Value = chkMail.Checked
    End Sub

    Protected Sub sds_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sds.Inserted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            ltrResult.Text = "エラーが発生しました。"
            Dim mail As New MailMessage("CQW15204@nifty.com",
                "webmaster@wings.msn.to", "エラー発生通知", e.Exception.Message)
            Dim cli As New SmtpClient()
            cli.Send(mail)
        End If
    End Sub
End Class