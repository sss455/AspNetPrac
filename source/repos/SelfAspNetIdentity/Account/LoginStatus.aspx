<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.aspx.cs" Inherits="SelfAspNetIdentity.Account.LoginStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LoginView ID="lv" runat="server">
                <%-- 未ログインユーザー --%>
                <AnonymousTemplate>
                    <asp:HyperLink ID="link" runat="server" ImageUrl="~/Image/Login.png" NavigateUrl="~/Account/Login" Text="ログイン">HyperLink</asp:HyperLink>
                </AnonymousTemplate>
                <%-- ログインユーザー --%>
                <LoggedInTemplate>
                    <asp:LoginStatus ID="ls" runat="server" LogoutImageUrl="~/Image/Logout.png" LogoutAction="Redirect" LogoutPageUrl="~/Account/Login" OnLoggingOut="ls_LoggingOut" />
                </LoggedInTemplate>
            </asp:LoginView>
        </div>
    </form>
</body>
</html>
