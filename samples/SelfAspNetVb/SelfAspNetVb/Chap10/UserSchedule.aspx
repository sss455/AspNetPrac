<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UserSchedule.aspx.vb" Inherits="SelfAspNetVb.UserSchedule" %>

<%@ Register src="Schedule.ascx" tagname="Schedule" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ユーザーコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:Schedule ID="sche" runat="server" Uid="yyamada" />
    
    </div>
    </form>
</body>
</html>
