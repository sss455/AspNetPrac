<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeViewDb.aspx.cs" Inherits="SelfAspNet.Chap09.TreeViewDb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="tree" runat="server" DataSourceID="smdsDb"></asp:TreeView>
            <asp:SiteMapDataSource ID="smdsDb" runat="server" SiteMapProvider="SqlSiteMapProvider" />
        </div>
    </form>
</body>
</html>
