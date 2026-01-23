<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AppSettings.aspx.vb" Inherits="SelfAspNetVb.AppSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>アプリケーション設定</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Author変数（式構文）：<asp:Literal ID="ltrExp" runat="server" Mode="Encode" Text="<%$ AppSettings:Author %>"></asp:Literal>
        <br />
        Author変数（コード）：<asp:Literal ID="ltrCode" runat="server" Mode="Encode"></asp:Literal>

    </div>
    </form>
</body>
</html>
