<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentType.aspx.cs" Inherits="SelfAspNet.Chap06.ContentType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="sds" runat="server" 
                DataSourceMode="DataReader"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
                ProviderName="<%$ ConnectionStrings:SelfAsp.ProviderName %>" 
                SelectCommand="SELECT type, data FROM Photo WHERE (id = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
