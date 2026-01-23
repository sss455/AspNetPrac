<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Required.aspx.cs" Inherits="SelfAspNet.Chap03.Required" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>RequiredFieldValidatorコントロール</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            URL： 
            <asp:TextBox ID="txtUrl" runat="server" Columns="30">http://</asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="送信" />
            <asp:RequiredFieldValidator ID="reqUrl" runat="server" 
                ControlToValidate="txtUrl" CssClass="valid" ErrorMessage="URL欄が未入力です。" 
                InitialValue="http://"></asp:RequiredFieldValidator>
        </div>
    </form>
</body>
</html>
