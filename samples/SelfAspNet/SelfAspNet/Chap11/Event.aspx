<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="SelfAspNet.Chap11.Event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>jQuery</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="manager" runat="server" AjaxFrameworkMode="Disabled" EnableCdn="True">
                <Scripts>
                    <asp:ScriptReference Name="jquery" />
                </Scripts>
            </asp:ScriptManager>
            <script>
                $(function () {
                    $('img').click(function () {
                        $(this).fadeOut(5000);
                    });
                });
            </script>
            <div id="menu">
                <p><img src="https://wings.msn.to/books/978-4-7981-6044-3/978-4-7981-6044-3_logo.jpg" class="other" /></p>
                <p><img src="https://wings.msn.to/books/978-4-7981-5112-0/978-4-7981-5112-0_logo.jpg" class="java" /></p>
                <p><img src="https://wings.msn.to/books/978-4-7981-5757-3/978-4-7981-5757-3_logo.jpg" class="other" /></p>
                <p><img src="https://wings.msn.to/books/978-4-7981-5382-7/978-4-7981-5382-7_logo.jpg" class="csharp" /></p>
            </div>
        </div>
    </form>
</body>
</html>