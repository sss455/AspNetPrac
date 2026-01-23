<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSchedule.aspx.cs" Inherits="SelfAspNet.Chap10.UserSchedule" %>

<%@ Register Src="~/Chap10/Schedule.ascx" TagPrefix="uc1" TagName="Schedule" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Schedule runat="server" id="sche" Uid="nkakeya" />
        </div>
    </form>
</body>
</html>
