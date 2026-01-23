<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginView.aspx.cs" Inherits="SelfAspNetIdentity.LoginView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <body>
        <form id="form1" runat="server">
            <div>
                <asp:LoginView ID="lv" runat="server">
                    <AnonymousTemplate>
                        未ログインユーザーの画面です。
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        ログインユーザーの画面です。
                    </LoggedInTemplate>
                    <RoleGroups>
                        <asp:RoleGroup Roles="Admin">
                            <ContentTemplate>
                                Adminロール用の画面です。
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </div>
        </form>
    </body>
</html>
