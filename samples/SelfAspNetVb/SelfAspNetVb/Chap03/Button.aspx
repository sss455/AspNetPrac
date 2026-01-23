<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Button.aspx.vb" Inherits="SelfAspNetVb.Button" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ボタンコントロール</title>
    <script>
        function conf() {
            return confirm('実行しても良いですか？');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btn1" runat="server" 
            onclientclick="return confirm('実行しても良いですか？');" Text="Button" />
        &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" onclientclick="return conf()">LinkButton</asp:LinkButton>
        &nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image/go.gif" />    
    </div>
    </form>
</body>
</html>
