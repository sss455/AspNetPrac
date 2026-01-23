<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PhotoUpload.aspx.vb" Inherits="SelfAspNetVb.PhotoUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>バイナリデータの登録</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        アップロードファイル：<asp:FileUpload ID="upfile" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="アップロード" />
    
        
        <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" ProviderName="<%$ ConnectionStrings:SelfAsp.ProviderName %>" InsertCommand="INSERT INTO Photo(type, data) VALUES (@type, @data)">
            <InsertParameters>
                <asp:ControlParameter ControlID="upfile" Name="data" PropertyName="FileBytes" />
            </InsertParameters>
        </asp:SqlDataSource>
    
        
    </div>
    </form>
</body>
</html>
