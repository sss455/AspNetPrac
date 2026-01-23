<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wizard.aspx.cs" Inherits="SelfAspNet.Chap09.Wizard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Wizard ID="wiz" runat="server" BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ActiveStepIndex="0" HeaderText="書籍アンケート" OnFinishButtonClick="wiz_FinishButtonClick" OnNextButtonClick="wiz_NextButtonClick">
                <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Left" />
                <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
                <WizardSteps>
                    <%-- 個人情報 --%>
                    <asp:WizardStep runat="server" StepType="Start" title="個人情報">
                        あなた自身について教えてください。<br />
                        <br />
                        名前：<br />
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="名前は必須です。" CssClass="valid" ControlToValidate="txtName" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        E-Mailアドレス：<br />
                        <asp:TextBox ID="txtEmail" runat="server" Columns="35"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="E-Mailは必須です。" Text="*" CssClass="valid" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regEmail" runat="server" ErrorMessage="E-mailは正しい形式で入力してください。" CssClass="valid" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        <br />
                        <br />
                        E-Mailアドレス(確認)：<br />
                        <asp:TextBox ID="txtEmail2" runat="server" Columns="35"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail2" runat="server" ErrorMessage="E-Mail(確認)は必須です。" Text="*" CssClass="valid" ControlToValidate="txtEmail2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpEmail" runat="server" ErrorMessage="E-Mail(確認)は、E-Mailと等しくなければなりません。" Text="*" CssClass="valid" ControlToCompare="txtEmail" ControlToValidate="txtEmail2" SetFocusOnError="True"></asp:CompareValidator>
                        <br />
                        <br />
                    </asp:WizardStep>
                    <%-- 書籍感想 --%>
                    <asp:WizardStep runat="server" StepType="Step" title="書籍感想">
                        本書に関するご意見、ご感想をお願いします。
                        <br />
                        <br />
                        本書購入の目的：<asp:DropDownList ID="ddlPurpose" runat="server">
                            <asp:ListItem>仕事</asp:ListItem>
                            <asp:ListItem Value="趣味"></asp:ListItem>
                            <asp:ListItem Value="教育"></asp:ListItem>
                            <asp:ListItem Value="研究資料"></asp:ListItem>
                            <asp:ListItem Value="その他"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        本書の評価：<br />
                        <asp:RadioButtonList ID="rdoEvaluate" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>良い</asp:ListItem>
                            <asp:ListItem>普通</asp:ListItem>
                            <asp:ListItem>悪い</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="reqEvaluate" runat="server" ErrorMessage="評価は必ず選択してください。" CssClass="valid" SetFocusOnError="True" Text="*" ControlToValidate="rdoEvaluate"></asp:RequiredFieldValidator>
                    </asp:WizardStep>
                    <%-- 自由欄 --%>
                    <asp:WizardStep runat="server" StepType="Finish" Title="自由欄">
                        その他、本書に関するご意見をお願いいたします。
                        <br />
                        <br />
                        自由記入欄：<br />
                        <asp:TextBox ID="txtFree" runat="server" Columns="25" SkinID="3" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        メールサービスを希望しますか？<br />
                        <asp:CheckBox ID="chkMail" runat="server" Checked="True" Text="希望する" />
                    </asp:WizardStep>
                    <%-- Thank You! --%>
                    <asp:WizardStep runat="server" StepType="Complete" Title="Thank You!">
                        <asp:Literal ID="ltrResult" runat="server" Text="アンケートへのご協力ありがとうございました。"></asp:Literal>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" InsertCommand="INSERT INTO Quest(name, email, purpose, evaluate, free, mail) VALUES (@name, @email, @purpose, @evaluate, @free, @mail)" ProviderName="<%$ ConnectionStrings:SelfAsp.ProviderName %>" OnInserted="sds_Inserted" OnInserting="sds_Inserting">
                <InsertParameters>
                    <asp:Parameter Name="name" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="purpose" />
                    <asp:Parameter Name="evaluate" />
                    <asp:Parameter Name="free" />
                    <asp:Parameter Name="mail" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="以下のエラーが発生しました。" ShowMessageBox="True" ShowSummary="False" />
        </div>
    </form>
</body>
</html>
