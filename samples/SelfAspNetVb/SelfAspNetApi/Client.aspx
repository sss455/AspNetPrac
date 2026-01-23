<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Client.aspx.vb" Inherits="SelfAspNetApi.Client" %>
<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Web API</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="manager" runat="server" AjaxFrameworkMode="Disabled" EnableCdn="True">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
                <%--<asp:ScriptReference Path="~/Scripts/BookSearch.js" />--%>
            </Scripts>
        </asp:ScriptManager>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
          <%: Scripts.Render("~/bundles/my") %>
        </asp:PlaceHolder>
        <input id="txtIsbn" type="text" /><input id="btnSearch" type="button" value="検索" /><br />
        <div id="result">
        </div>
    </div>
    </form>
</body>
</html>
