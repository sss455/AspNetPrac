<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CheckBox.aspx.vb" Inherits="SelfAspNetVb.CheckBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CheckBoxListコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        好きな食べ物は？<br />
        <asp:CheckBoxList ID="list" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal">
            <asp:ListItem>お寿司</asp:ListItem>
            <asp:ListItem>焼き肉</asp:ListItem>
            <asp:ListItem>鰻</asp:ListItem>
        </asp:CheckBoxList>    
    </div>
    </form>
</body>
</html>
