<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="SelfAspNet.Chap10.Blog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>URLルーティング</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Literal ID="ltrYear" runat="server"
                Text="<%$ RouteValue:year %>" Mode="Encode"></asp:Literal>
            年 
            <asp:Literal ID="ltrMonth" runat="server"
                Text="<%$ RouteValue:month %>" Mode="Encode"></asp:Literal>
            月
            <asp:Literal ID="ltrDay" runat="server"
                Text="<%$ RouteValue:day %>" Mode="Encode"></asp:Literal>
            日
        </div>
    </form>
</body>
</html>
