<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CrudMethod.aspx.vb" Inherits="SelfAspNetVb.CrudMethod" %>
<%--<%@ OutputCache Duration="120" VaryByParam="price" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>モデルバインディング</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="3" SelectMethod="GetBooksByPrice" AutoGenerateEditButton="True" DataKeyNames="isbn" UpdateMethod="UpdateBook" ItemType="SelfAspNetVb.Book">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
            <%--<Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                    <%#: Item.isbn %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>--%>
        </asp:GridView>

        <asp:ValidationSummary ID="summary" runat="server" HeaderText="以下のエラーが発生しました。" />
        <%--<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>--%>
    </div>
    </form>
</body>
</html>
