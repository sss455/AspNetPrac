<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageTag.aspx.cs" Inherits="SelfAspNet.Chap03.ImageTag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Imageコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="logo" runat="server" AlternateText="WINGSロゴ" ImageUrl="https://wings.msn.to/image/wings.jpg" />
        </div>
    </form>
</body>
</html>
