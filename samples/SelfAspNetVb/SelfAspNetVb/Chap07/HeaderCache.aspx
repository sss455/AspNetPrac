<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HeaderCache.aspx.vb" Inherits="SelfAspNetVb.HeaderCache" Culture="auto" UICulture="auto" %>
<%@ OutputCache VaryByParam="none" VaryByHeader="Accept-Language" Duration="120" %>
<%--<%@ OutputCache CacheProfile="MyCache" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>VaryByHeader属性</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblMessage" runat="server" 
            Text="<%$ Resources:MyRes, Greeting %>"></asp:Label>
        <br />
        <asp:Label ID="lblTimeTitle" runat="server" 
            Text="<%$ Resources:MyRes, Update %>"></asp:Label>
        ：<asp:Label ID="lblCurrent" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
