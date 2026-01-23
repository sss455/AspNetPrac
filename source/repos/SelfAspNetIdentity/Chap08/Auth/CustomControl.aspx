<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomControl.aspx.cs" Inherits="SelfAspNetIdentity.Chap08.Auth.CustomControl" %>

<%@ Register Assembly="SelfAspNetIdentity" Namespace="SelfAspNetIdentity.Chap10" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            あなたのサイトは<cc1:ProfileLabel ID="prof" runat="server" ProfileName="Url"></cc1:ProfileLabel>ですね。
        </div>
    </form>
</body>
</html>
