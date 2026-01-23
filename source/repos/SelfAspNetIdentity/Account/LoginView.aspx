<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginView.aspx.cs" Inherits="SelfAspNetIdentity.Account.LoginView" %>

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
                    <asp:Label ID="Label3" runat="server" Text="未ログインユーザーの画面です。"></asp:Label>
                </AnonymousTemplate>
                <%-- ログインユーザー --%>
                <LoggedInTemplate>
                    <asp:Label ID="Label2" runat="server" Text="ログインユーザーの画面です。"></asp:Label>
                </LoggedInTemplate>
                <RoleGroups>
                    <%-- Adminロールユーザー --%>
                    <asp:RoleGroup Roles="Admin">
                        <ContentTemplate>
                            <asp:Label ID="Label1" runat="server" Text="Adminロール用の画面です。"></asp:Label>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
    </form>
</body>
</html>
