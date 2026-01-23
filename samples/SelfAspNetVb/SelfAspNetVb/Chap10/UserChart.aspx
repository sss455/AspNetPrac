<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UserChart.aspx.vb" Inherits="SelfAspNetVb.UserChart" %>

<%@ Register src="ChartParts.ascx" tagname="ChartParts" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ユーザコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ChartParts ID="cht" runat="server" Brand="34259" />
    
    </div>
    </form>
</body>
</html>
