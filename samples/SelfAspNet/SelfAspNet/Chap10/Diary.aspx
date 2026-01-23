<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Diary.aspx.cs" Inherits="SelfAspNet.Chap10.Diary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FriendlyURLs</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="list" runat="server" ItemType="String">
            <ItemTemplate>・<%#: Item%><br /></ItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
