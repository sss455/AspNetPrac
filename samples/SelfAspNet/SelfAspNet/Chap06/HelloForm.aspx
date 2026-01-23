<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelloForm.aspx.cs" Inherits="SelfAspNet.Chap06.HelloForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ポストデータ</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            名前：<input type="text" name="txtName" size="10" maxlength="15" />
            <asp:Button ID="btnSend" runat="server" Text="送信" Style="height: 21px"
                OnClick="btnSend_Click" />
            <br />
            <asp:Label ID="lblGreet" runat="server"></asp:Label>

        </div>
    </form>
</body>
</html>
