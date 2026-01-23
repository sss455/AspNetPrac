<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GridViewBook.aspx.vb" Inherits="SelfAspNetVb.GridViewBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GridViewコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="isbn" DataSourceID="sds" ForeColor="Black" GridLines="Vertical" 
            PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="isbn" 
                    DataNavigateUrlFormatString="http://www.wings.msn.to/index.php/-/A-03/{0}/" 
                    DataTextField="isbn" HeaderText="ISBNコード" />
                <asp:BoundField DataField="title" HeaderText="書名" SortExpression="title" />
                <asp:BoundField DataField="publish" HeaderText="出版社" SortExpression="publish" />
                <asp:BoundField DataField="published" DataFormatString="{0:yy/MM/dd}" 
                    HeaderText="発売日" SortExpression="published" />
                <asp:BoundField DataField="price" DataFormatString="{0:#,###円}" HeaderText="単価" 
                    HtmlEncode="False" SortExpression="price" />
                <asp:CheckBoxField DataField="cdrom" HeaderText="CD-ROM" 
                    SortExpression="cdrom" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="sds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
            DeleteCommand="DELETE FROM [Book] WHERE [isbn] = @isbn" 
            InsertCommand="INSERT INTO [Book] ([isbn], [title], [price], [publish], [published], [cdrom]) VALUES (@isbn, @title, @price, @publish, @published, @cdrom)" 
            SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book]" 
            UpdateCommand="UPDATE [Book] SET [title] = @title, [price] = @price, [publish] = @publish, [published] = @published, [cdrom] = @cdrom WHERE [isbn] = @isbn">
            <DeleteParameters>
                <asp:Parameter Name="isbn" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="isbn" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="publish" Type="String" />
                <asp:Parameter DbType="Date" Name="published" />
                <asp:Parameter Name="cdrom" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="publish" Type="String" />
                <asp:Parameter DbType="Date" Name="published" />
                <asp:Parameter Name="cdrom" Type="Boolean" />
                <asp:Parameter Name="isbn" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>    
    </div>
    </form>
</body>
</html>
