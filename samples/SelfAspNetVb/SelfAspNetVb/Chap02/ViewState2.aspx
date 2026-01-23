<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ViewState2.aspx.vb" Inherits="SelfAspNetVb.ViewState2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ビューステート</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtResult" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="btnSend" runat="server" Text="送信" />
    </div>
    </form>
</body>
</html>
