<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppendHeader.aspx.cs"
    Inherits="SelfAspNet.Chap06.AppendHeader" 
    ContentType="application/octet-stream"
    ResponseEncoding="Shift-JIS" %>
<asp:ListView ID="list" runat="server" DataSourceID="sds">
    <ItemTemplate><%# Eval("isbn")%>,<%# Eval("title")%>,<%# Eval("publish")%>,<%# Eval("price")%>,<%# Eval("published")%>,<%# Eval("cdrom")%>
    </ItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
    SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book] ORDER BY [isbn]">
</asp:SqlDataSource>
