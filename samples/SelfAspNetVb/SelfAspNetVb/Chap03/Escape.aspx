<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Escape.aspx.vb" Inherits="SelfAspNetVb.Escape" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Literalコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Literal ID="ltr" runat="server" Mode="Encode" Text="&lt;script&gt;alert('脆弱性！')&lt;/script&gt;"></asp:Literal>
    
    </div>
    </form>
</body>
</html>
