<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HelloForm.aspx.vb" Inherits="SelfAspNetVb.HelloForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ポストデータ</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        名前：<input type="text" name="txtName" size="10" maxlength="15" />
        <asp:Button ID="btnSend" runat="server" Text="送信" style="height: 21px" />
        <br />
        <asp:Label ID="lblGreet" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
