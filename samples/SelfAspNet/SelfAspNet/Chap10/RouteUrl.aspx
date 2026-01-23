<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouteUrl.aspx.cs" Inherits="SelfAspNet.Chap10.RouteUrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>URLルーティング</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="lnkRoute" runat="server" 
            NavigateUrl="<%$ RouteUrl:RouteName=blog, year=2019, month=12, day=4 %>">2019年12月4日の日記</asp:HyperLink>
    </div>
    </form>
</body>
</html>
