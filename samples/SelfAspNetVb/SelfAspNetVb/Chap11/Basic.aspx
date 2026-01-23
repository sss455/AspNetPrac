<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Basic.aspx.vb" Inherits="SelfAspNetVb.Basic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>jQuery</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="manager" runat="server" 
            AjaxFrameworkMode="Disabled" EnableCdn="True">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
            </Scripts>
        </asp:ScriptManager>
        <script>
        $(function () {
            $('#menu img.other').fadeOut(5000);
        });
        </script>
        <div id="menu">
            <p><img src="http://www.wings.msn.to/books/978-4-7981-3049-1/978-4-7981-3049-1_logo.jpg" class="java" /></p>
            <p><img src="http://www.wings.msn.to/books/978-4-7981-2344-8/978-4-7981-2344-8_logo.jpg" class="other" /></p>
            <p><img src="http://www.wings.msn.to/books/978-4-7981-2631-9/978-4-7981-2631-9_logo.jpg" class="php" /></p>   
            <p><img src="http://www.wings.msn.to/books/978-4-7981-1992-2/978-4-7981-1992-2_logo.jpg" class="other" /></p>
        </div>
    </form>
</body>
</html>
