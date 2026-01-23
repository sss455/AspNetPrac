<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListView.aspx.vb" Inherits="SelfAspNetVb.ListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ListViewコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:ListView ID="list" runat="server" DataKeyNames="isbn" DataSourceID="sds" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <span style="background-color: #FFFFFF; color: #284775;">
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px"
                            ImageUrl='<%# Eval("isbn", "http://www.wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード:
                    <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        単価:
                    <asp:Label ID="priceLabel" runat="server"
                        Text='<%# Eval("price", "{0:#,###円}") %>' />
                        <br />
                        出版社:
                    <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        発売日:
                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                        <br />
                        CD-ROM:
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #999999;">
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px"
                            ImageUrl='<%# Eval("isbn", "http://www.wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード:
                    <asp:Label ID="isbnLabel1" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        価格:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        出版社:
                    <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />
                        発売日:
                    <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />
                        CD-ROM:
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="キャンセル" />
                        <br />
                        <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>データは返されませんでした。</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">ISBNコード:
                    <asp:TextBox ID="isbnTextBox" runat="server" Text='<%# Bind("isbn") %>' />
                        <br />
                        書名:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        価格:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        出版社:
                    <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />
                        発売日:
                    <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />
                        CD-ROM:
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="挿入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
                        <br />
                        <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #E0FFFF; color: #333333;">
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px"
                            ImageUrl='<%# Eval("isbn", "http://www.wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード:
                    <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        単価:
                    <asp:Label ID="priceLabel" runat="server"
                        Text='<%# Eval("price", "{0:#,###円}") %>' />
                        <br />
                        出版社:
                    <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        発売日:
                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                        <br />
                        CD-ROM:
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" DeleteCommand="DELETE FROM [Book] WHERE [isbn] = @isbn" InsertCommand="INSERT INTO [Book] ([isbn], [title], [price], [publish], [published], [cdrom]) VALUES (@isbn, @title, @price, @publish, @published, @cdrom)" SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book] ORDER BY [isbn]" UpdateCommand="UPDATE [Book] SET [title] = @title, [price] = @price, [publish] = @publish, [published] = @published, [cdrom] = @cdrom WHERE [isbn] = @isbn">
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
