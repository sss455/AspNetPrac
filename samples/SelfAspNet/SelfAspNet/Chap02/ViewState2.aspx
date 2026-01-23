<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState2.aspx.cs" Inherits="SelfAspNet.Chap02.ViewState2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>こんにちは、ASP.NET</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtResult" runat="server" ViewStateMode="Inherit"></asp:TextBox>
            &nbsp;<asp:Button ID="btnSend" runat="server" Text="送信" />
            <br />
            <asp:Label ID="lblResult" runat="server">こんにちは</asp:Label>
        </div>
    </form>
</body>
</html>
