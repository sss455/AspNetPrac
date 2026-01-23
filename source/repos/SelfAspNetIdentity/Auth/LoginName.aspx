<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginName.aspx.cs" Inherits="SelfAspNetIdentity.Auth.LoginName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LoginName ID="lname" runat="server" FormatString="こんにちは、{0}さん！" ForeColor="DarkSlateGray" />
        </div>
    </form>
</body>
</html>
