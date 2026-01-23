<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App2.aspx.cs" Inherits="SelfAspNet.Chap07.App2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>アプリケーション変数</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblApp" runat="server" Text="Label"></asp:Label>
        <%--<br />
        <asp:Button ID="btn_delete" runat="server" Text="アプリケーション変数削除" OnClick="btn_delete_Click" />--%>
    </div>

    </form>
</body>
</html>
