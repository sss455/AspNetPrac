<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ViewStateGame.aspx.vb" Inherits="SelfAspNetVb.ViewStateGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数当てゲーム</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        1～100の値を入力してください：<asp:TextBox ID="txtNum" runat="server" Columns="3"></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="回答" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
