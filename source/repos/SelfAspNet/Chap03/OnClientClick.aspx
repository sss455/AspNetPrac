<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnClientClick.aspx.cs" Inherits="SelfAspNet.Chap03.OnClientClick" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function conf() {
            return confirm('実行しても良いですか？');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('実行しても良いですか？');">LinkButton</asp:LinkButton><br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="return conf();" />
        </div>
    </form>
</body>
</html>
