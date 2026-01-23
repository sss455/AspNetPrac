<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Limit.aspx.cs" Inherits="SelfAspNet.Chap09.Limit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="lnkPrev"   runat="server" Visible="False">前ページへ  </asp:HyperLink>&nbsp;
            <asp:HyperLink ID="lnkParent" runat="server" Visible="False">上位ページへ  </asp:HyperLink>&nbsp;
            <asp:HyperLink ID="lnkNext"   runat="server" Visible="False">次ページへ</asp:HyperLink>
        </div>
    </form>
</body>
</html>
