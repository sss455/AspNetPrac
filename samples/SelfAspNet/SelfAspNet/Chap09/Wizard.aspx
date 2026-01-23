<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wizard.aspx.cs" Inherits="SelfAspNet.Chap09.Wizard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Wizardコントロール</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Wizard ID="wiz" runat="server" BackColor="#F7F6F3"
                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ActiveStepIndex="0"
                HeaderText="書籍アンケート" OnFinishButtonClick="wiz_FinishButtonClick"
                OnNextButtonClick="wiz_NextButtonClick">
                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True"
                    Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC"
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                    ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em"
                    VerticalAlign="Top" />
                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="個人情報" StepType="Start">
                        あなた自身について教えてください。<br />
                        <br />
                        名前：<br />
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" runat="server"
                            ControlToValidate="txtName" ErrorMessage="名前は必須です。" SetFocusOnError="True" CssClass="valid">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        E-Mailアドレス：<br />
                        <asp:TextBox ID="txtEmail" runat="server" Columns="35"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regEmail" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="E-Mailは正しい形式で入力してください。"
                            SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="valid">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="E-Mailは必須です。" SetFocusOnError="True" CssClass="valid">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        E-Mailアドレス（確認）：<br />
                        <asp:TextBox ID="txtEmail2" runat="server" Columns="35"></asp:TextBox>
                        <asp:CompareValidator ID="cmpEmail" runat="server" ControlToCompare="txtEmail"
                            ControlToValidate="txtEmail2" ErrorMessage="E-Mail（確認）はE-Mailとひとしくなければなりません。"
                            SetFocusOnError="True" CssClass="valid">*</asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="reqEmail2" runat="server"
                            ControlToValidate="txtEmail2" ErrorMessage="E-Mail（確認）は必須です。"
                            SetFocusOnError="True" CssClass="valid">*</asp:RequiredFieldValidator>
                        <br />
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="書籍感想" StepType="Step">
                        本書に関するご意見、ご感想をお願いします。<br />
                        <br />
                        本書購入の目的：<asp:DropDownList ID="ddlPurpose" runat="server">
                            <asp:ListItem>仕事</asp:ListItem>
                            <asp:ListItem>趣味</asp:ListItem>
                            <asp:ListItem>教育</asp:ListItem>
                            <asp:ListItem>研究資料</asp:ListItem>
                            <asp:ListItem>その他</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        本書の評価：<br />
                        <asp:RadioButtonList ID="rdoEvaluate" runat="server"
                            RepeatDirection="Horizontal">
                            <asp:ListItem>良い</asp:ListItem>
                            <asp:ListItem>普通</asp:ListItem>
                            <asp:ListItem>悪い</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="reqEvaluate" runat="server"
                            ControlToValidate="rdoEvaluate" ErrorMessage="評価は必ず選択してください。"
                            SetFocusOnError="True" CssClass="valid">*</asp:RequiredFieldValidator>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep3" runat="server" StepType="Finish" Title="自由欄">
                        その他、本書に関するご意見をお願いいたします。<br />
                        <br />
                        自由記入欄：<br />
                        <asp:TextBox ID="txtFree" runat="server" Columns="25" Rows="3"
                            TextMode="MultiLine"></asp:TextBox>
                        <br />
                        メールサービスの利用を希望しますか？<br />
                        <asp:CheckBox ID="chkMail" runat="server" Checked="True" Text="希望する" />
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep4" runat="server" StepType="Complete" Title="Thank You!">
                        <asp:Literal ID="ltrResult" runat="server" Text="アンケートへのご協力ありがとうございました。"></asp:Literal>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
            <asp:SqlDataSource ID="sds" runat="server"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                ProviderName="System.Data.SqlClient"
                InsertCommand="INSERT INTO Quest(name, email, purpose, evaluate, free, mail) VALUES (@name, @email, @purpose, @evaluate, @free, @mail)"
                OnInserted="sds_Inserted" OnInserting="sds_Inserting">
                <InsertParameters>
                    <asp:Parameter Name="name" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="purpose" />
                    <asp:Parameter Name="evaluate" />
                    <asp:Parameter Name="free" />
                    <asp:Parameter Name="mail" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:ValidationSummary ID="summary" runat="server" HeaderText="以下のエラーが発生しました。"
                ShowMessageBox="True" ShowSummary="False" />

        </div>
    </form>
</body>
</html>
