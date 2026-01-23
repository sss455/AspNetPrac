<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Custom.aspx.cs" Inherits="SelfAspNet.Chap03.Custom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CustomValidatorコントロール</title>
    <link href="../Site.css" rel="stylesheet" />
    <script>
        function myValidate(source, args) {
            args.IsValid = (args.Value.length <= 20);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            名前：
            <asp:TextBox ID="txtName" runat="server" Columns="25"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="送信" OnClick="btnSubmit_Click" />
            <asp:CustomValidator ID="cusName" runat="server" ErrorMessage="名前は20文字以内で入力してください。" ClientValidationFunction="myValidate" ControlToValidate="txtName" CssClass="valid" OnServerValidate="cusName_ServerValidate"></asp:CustomValidator>
        </div>
    </form>
</body>
</html>
