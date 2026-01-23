<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Db.aspx.cs" Inherits="SelfAspNet.Chap09.Db" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="tree" runat="server" DataSourceID="smds"></asp:TreeView>
            <asp:SiteMapDataSource ID="smds" runat="server" ShowStartingNode="False" StartFromCurrentNode="True" />
        </div>
    </form>
</body>
</html>
