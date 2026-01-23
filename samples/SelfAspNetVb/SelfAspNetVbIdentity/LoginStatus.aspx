<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginStatus.aspx.vb" Inherits="SelfAspNetVbIdentity.LoginStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LoginStatusコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:LoginView ID="lv" runat="server">
            <AnonymousTemplate>
                <asp:HyperLink ID="link" runat="server" ImageUrl="~/Image/Login.png" NavigateUrl="~/Account/Login">ログイン</asp:HyperLink>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <asp:LoginStatus ID="ls" runat="server" LogoutAction="Redirect" LogoutImageUrl="~/Image/Logout.png" LogoutPageUrl="~/Account/Login.aspx" OnLoggingOut="ls_LoggingOut" />
            </LoggedInTemplate>
        </asp:LoginView>
    
    </div>
    </form>
</body>
</html>
