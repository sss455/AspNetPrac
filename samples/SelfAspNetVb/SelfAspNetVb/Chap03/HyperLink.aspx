<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HyperLink.aspx.vb" Inherits="SelfAspNetVb.HyperLink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>HyperLinkコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="link" runat="server" ImageUrl="http://www.wings.msn.to/image/wings.jpg"
            NavigateUrl="http://www.wings.msn.to/" Text="サーバサイド技術の学び舎"></asp:HyperLink>    
    </div>
    </form>
</body>
</html>
