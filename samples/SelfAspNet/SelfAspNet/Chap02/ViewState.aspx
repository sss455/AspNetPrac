<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState.aspx.cs" Inherits="SelfAspNet.Chap02.ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>こんにちは、ASP.NET</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblResult" runat="server"></asp:Label>
            &nbsp;<asp:Button ID="btnSend" runat="server" Text="送信" />
        </div>
    </form>
</body>
</html>
