<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FileUploadMulti.aspx.vb" Inherits="SelfAspNetVb.FileUploadMulti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FileUploadコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        アップロードファイル：<br />
        <asp:FileUpload ID="upload" runat="server" AllowMultiple="True" />
        <br />
        <asp:Button ID="btnUpload" runat="server" Text="アップロード" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>    
    </div>
    </form>
</body>
</html>
