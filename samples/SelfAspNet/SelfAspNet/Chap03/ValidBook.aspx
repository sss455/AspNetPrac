<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidBook.aspx.cs" Inherits="SelfAspNet.Chap03.ValidBook" %>

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
            ISBNコード：<br />
            <asp:TextBox ID="txtIsbn" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                ID="regIsbn" runat="server" ControlToValidate="txtIsbn" ErrorMessage="ISBNコードを正しい形式で入力してください。"
                SetFocusOnError="True" 
                ValidationExpression="[0-9]{1}-[0-9]{3,5}-[0-9]{3,5}-[0-9X]{1}" 
                CssClass="valid">*</asp:RegularExpressionValidator><br />
            書名：<br />
            <asp:TextBox ID="txtTitle" runat="server" Columns="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqTitle" runat="server" ControlToValidate="txtTitle"
                ErrorMessage="書名は必須です。" SetFocusOnError="True" CssClass="valid">*</asp:RequiredFieldValidator><br />
            単価：<br />
            <asp:TextBox ID="txtPrice" runat="server" Columns="5"></asp:TextBox>円<asp:RangeValidator
                ID="rngPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="単価は0～10000の範囲で入力してください。"
                MaximumValue="10000" MinimumValue="0" SetFocusOnError="True" 
                Type="Integer" CssClass="valid">*</asp:RangeValidator><br />
            <asp:Button ID="btnSubmit" runat="server" Text="送信" /><br />
            <asp:ValidationSummary ID="summary" runat="server" ShowMessageBox="True" 
                ShowSummary="False" CssClass="valid" />
        </div>
    </form>
</body>
</html>
