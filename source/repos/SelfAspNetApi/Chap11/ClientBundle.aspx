<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientBundle.aspx.cs" Inherits="SelfAspNetApi.Chap11.ClientBundle" %>
<%-- 追加 --%>
<%@ Import Namespace="System.Web.Optimization" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="manager" runat="server" AjaxFrameworkMode="Disabled" EnableCdn="True">
                <Scripts>
                    <asp:ScriptReference Name="jquery" />
                    <%-- インポートが重複してしまうため削除
                    <asp:ScriptReference Path="~/Scripts/BookSearch.js" />
                    --%>
                </Scripts>
            </asp:ScriptManager>

            <%-- 追加 --%>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <%: Scripts.Render("~/bundles/my") %>
            </asp:PlaceHolder>


            <input id="txtIsbn" type="text" />
            <input id="btnSearch" type="button" value="検索" />
            <div id="result"></div>
        </div>
    </form>
</body>
</html>
