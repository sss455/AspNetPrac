<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustomControl.aspx.vb" Inherits="SelfAspNetVbIdentity.CustomControl" %>

<%@ Register assembly="SelfAspNetVbIdentity" namespace="SelfAspNetVbIdentity" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        あなたのサイトは<cc1:ProfileLabel ID="prof" runat="server" ProfileName="Url">
        </cc1:ProfileLabel>
        ですね。</div>
    </form>
</body>
</html>
