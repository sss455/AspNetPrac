<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookie.aspx.cs" Inherits="SelfAspNet.Chap07.Cookie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>クッキー</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            E-Mailアドレス：<asp:TextBox ID="txtMail" runat="server" Columns="30"
                MaxLength="100"></asp:TextBox>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="登録" OnClick="btnSave_Click" />

        </div>
    </form>
</body>
</html>
