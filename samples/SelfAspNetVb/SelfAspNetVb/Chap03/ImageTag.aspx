<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImageTag.aspx.vb" Inherits="SelfAspNetVb.ImageTag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Imageコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="logo" runat="server" AlternateText="WINGSロゴ" ImageUrl="http://www.wings.msn.to/image/wings.jpg" />    
    </div>
    </form>
</body>
</html>
