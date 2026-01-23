<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadioButton.aspx.cs" Inherits="SelfAspNet.Chap03.RadioButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButtonList ID="list" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="list_SelectedIndexChanged">
                <asp:ListItem Value="お寿司" Selected="True">お寿司</asp:ListItem>
                <asp:ListItem Value="焼肉">焼肉</asp:ListItem>
                <asp:ListItem Value="鰻">鰻</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblRsult" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
