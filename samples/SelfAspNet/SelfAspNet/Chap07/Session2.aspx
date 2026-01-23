<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session2.aspx.cs" Inherits="SelfAspNet.Chap07.Session2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>sessionState要素</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            セッション情報"title"の値：<asp:Label ID="lblSession" runat="server"></asp:Label>
            <%--<br />
            <asp:Button ID="btn_delete" runat="server" OnClick="btn_delete_Click" Text="セッション削除" />--%>

        </div>
    </form>
</body>
</html>
