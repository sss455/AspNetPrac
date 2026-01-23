<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidSummary.aspx.cs" Inherits="SelfAspNet.Chap03.ValidSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検証コントロール</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            名前：<br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="名前は必須です" ControlToValidate="txtName" CssClass="valid" SetFocusOnError="True"></asp:RequiredFieldValidator><br />

            体重：<br />
            <asp:TextBox ID="txtWeight" runat="server" Columns="5"></asp:TextBox>
            <asp:RangeValidator ID="rngWeight" runat="server" ErrorMessage="体重は0 ～ 300Kg の範囲で入力してください。" ControlToValidate="txtWeight" CssClass="valid" MaximumValue="300" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator><br />

            誕生日：<br />
            <asp:TextBox ID="txtBirth" runat="server" Columns="10"></asp:TextBox>
            <asp:CompareValidator ID="cmpBirth" runat="server" ErrorMessage="誕生日は日付形式で入力してください。" ControlToValidate="txtBirth" CssClass="valid" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date"></asp:CompareValidator><br />

            E-Mail：<br />
            <asp:TextBox ID="txtEmail" runat="server" Columns="50"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regEmail" runat="server" ErrorMessage="E-Mailアドレスは正しい形式で入力してください。" ControlToValidate="txtEmail" CssClass="valid" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />

            E-Mail(確認)：<br />
            <asp:TextBox ID="txtEmail2" runat="server" Columns="50"></asp:TextBox>
            <asp:CompareValidator ID="cmpEmail2" runat="server" ErrorMessage="E-MailとE-Mail（確認）は等しい必要があります。" ControlToCompare="txtEmail" ControlToValidate="txtEmail2" CssClass="valid" SetFocusOnError="True"></asp:CompareValidator><br />

            <asp:Button ID="btnSubmit" runat="server" Text="決定" OnClick="btnSubmit_Click" />
            <br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
            <asp:ValidationSummary ID="summary" runat="server" CssClass="valid" />
        </div>
    </form>
</body>
</html>
