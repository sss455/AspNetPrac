<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeView.aspx.cs" Inherits="SelfAspNet.Chap09.TreeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TreeView ID="tree" runat="server" DataSourceID="smds" ImageSet="News" NodeIndent="10">
                <HoverNodeStyle Font-Underline="True" />
                <NodeStyle Font-Names="Arial" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
            <%-- <asp:SiteMapDataSource ID="smds" runat="server" /> --%>
            <asp:SiteMapDataSource ID="smds" runat="server" SiteMapProvider="NextSiteMapProvider" />
        </div>
    </form>
</body>
</html>
