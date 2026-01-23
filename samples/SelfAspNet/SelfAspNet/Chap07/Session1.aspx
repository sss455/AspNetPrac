<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session1.aspx.cs" Inherits="SelfAspNet.Chap07.Session1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>sessionState要素</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            セッションが記録されました。<br />
            ［<asp:HyperLink ID="lnk" runat="server" NavigateUrl="~/Chap07/Session2.aspx">Session2.aspxへ</asp:HyperLink>］
        </div>
    </form>
</body>
</html>
<%--  --%>