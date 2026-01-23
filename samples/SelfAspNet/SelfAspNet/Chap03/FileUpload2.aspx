<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload2.aspx.cs" Inherits="SelfAspNet.Chap03.FileUpload2" %>

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
            <asp:FileUpload ID="upload" runat="server" />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="アップロード" 
                onclick="btnUpload_Click" />
            <br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
