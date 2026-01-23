<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.aspx.cs" Inherits="SelfAspNet.Chap04.DetailsView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>DetailsViewコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:DetailsView ID="dv" runat="server" AllowPaging="True"
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="isbn" DataSourceID="sds"
                ForeColor="#333333" GridLines="None" Height="50px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:ImageField DataAlternateTextField="title" DataImageUrlField="isbn"
                        DataImageUrlFormatString="https://wings.msn.to/books/{0}/{0}.jpg"
                        HeaderText="表紙画像" InsertVisible="False" ReadOnly="True">
                        <ControlStyle Height="160px" Width="110px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="isbn" HeaderText="ISBNコード" ReadOnly="True"
                        SortExpression="isbn" />
                    <asp:BoundField DataField="title" HeaderText="書名" SortExpression="title" />
                    <asp:BoundField DataField="price" DataFormatString="{0:0,000円}" HeaderText="単価" SortExpression="price" />
                    <asp:BoundField DataField="publish" HeaderText="出版社" SortExpression="publish" />
                    <asp:BoundField DataField="published" DataFormatString="{0:yyyy年MM月dd日}"
                        HeaderText="発売日" SortExpression="published" />
                    <asp:CheckBoxField DataField="cdrom" HeaderText="CD-ROM"
                        SortExpression="cdrom" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                        ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="sds" runat="server"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                DeleteCommand="DELETE FROM [Book] WHERE [isbn] = @isbn"
                InsertCommand="INSERT INTO [Book] ([isbn], [title], [price], [publish], [published], [cdrom]) VALUES (@isbn, @title, @price, @publish, @published, @cdrom)"
                SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book] ORDER BY [published] DESC"
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
