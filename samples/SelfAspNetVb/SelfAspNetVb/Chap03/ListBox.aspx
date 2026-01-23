<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListBox.aspx.vb" Inherits="SelfAspNetVb.ListBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ListBoxコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="list" runat="server" AutoPostBack="True" OnSelectedIndexChanged="list_SelectedIndexChanged" SelectionMode="Multiple">
            <asp:ListItem>お寿司</asp:ListItem>
            <asp:ListItem>焼き肉</asp:ListItem>
            <asp:ListItem>鰻</asp:ListItem>
        </asp:ListBox>    
    </div>
    </form>
</body>
</html>
