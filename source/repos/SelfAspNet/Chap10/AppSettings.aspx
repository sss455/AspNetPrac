<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppSettings.aspx.cs" Inherits="SelfAspNet.Chap10.AppSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Authoer変数（式構文）：<asp:Literal ID="ltrExp" runat="server" Text="<%$ AppSettings:Author %>"></asp:Literal>
            <br />
            Authoer変数（コード）：<asp:Literal ID="ltrCode" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
