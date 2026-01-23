<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Custom.aspx.cs" Inherits="SelfAspNet.Chap03.Custom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CustomValidatorコントロール</title>
    <script>
        function myValidate(source, args) {
            args.IsValid = (args.Value.length <= 20);
        }
    </script>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            名前： 
            <asp:TextBox ID="txtName" runat="server" Columns="25"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="送信" />
            <asp:CustomValidator ID="cusName" runat="server" 
                ClientValidationFunction="myValidate" ControlToValidate="txtName" 
                CssClass="valid" ErrorMessage="名前は20文字以内で入力してください。" 
                OnServerValidate="cusName_ServerValidate"></asp:CustomValidator>
        </div>
    </form>
</body>
</html>
