<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListViewGroup.aspx.cs" Inherits="SelfAspNet.Chap04.ListViewGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="list" runat="server" DataKeyNames="isbn" DataSourceID="sds" InsertItemPosition="LastItem" GroupItemCount="3">
                <%-- 1行おきに表示されるテンプレート（ItemTemplateと交互に表示） --%>
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color:#FFF8DC;">
                        ★AlternatingItemTemplate<br />
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード：
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        価格:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:#,###円}") %>' />
                        <br />
                        出版社:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        発売日:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                        <br />
                        CD-ROM：
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                    </td>
                </AlternatingItemTemplate>
                <%-- データ編集時に表示されるテンプレート --%>
                <EditItemTemplate>
                    <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                        ★EditItemTemplate<br />
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード：
                        <asp:Label ID="isbnLabel1" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名：
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        価格：
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        出版社：
                        <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />
                        発売日：
                        <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />CD-ROM：
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="キャンセル" />
                    </td>
                </EditItemTemplate>

                <%-- データセットが空の場合のテンプレート --%>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>データは返されませんでした。(★EmptyDataTemplate)</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <%-- 空項目に適用されるテンプレート --%>
                <EmptyItemTemplate>
                    <td runat="server">
                        ★EmptyItemTemplate<br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="https://wings.msn.to/image/wings.jpg" />
                    </td>
                </EmptyItemTemplate>
                <%-- グループ単位の外枠 --%>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server">★GroupTemplate</td>
                    </tr>
                </GroupTemplate>

                <%-- データ新規登録時に表示されるテンプレート --%>
                <InsertItemTemplate>
                    <td runat="server" style="">
                        ★InsertItemTemplate<br />
                        ISBNコード：
                        <asp:TextBox ID="isbnTextBox" runat="server" Text='<%# Bind("isbn") %>' />
                        <br />
                        書名：
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        価格：
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        出版社：
                        <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />
                        発売日：
                        <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />CD-ROM：
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="挿入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
                    </td>
                </InsertItemTemplate>
                <%-- データ項目を表示するためのテンプレート --%>
                <ItemTemplate>
                    <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                        ★ItemTemplate<br />
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <br />
                        ISBNコード：
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        価格:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:#,###円}") %>' />
                        <br />
                        出版社:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        発売日:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                        <br />
                        CD-ROM：
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                    </td>
                </ItemTemplate>
                <%-- リスト全体の外枠 --%>
                <LayoutTemplate>
                    <table runat="server">
                        <!-- groupPlaceholderContainer -->
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- ページャー -->
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <%-- データ項目選択時に表示されるテンプレート --%>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        ★SelectedItemTemplate<br />
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />
                        publish:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        published:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <br />
                    </td>
                </SelectedItemTemplate>

            </asp:ListView>

            <%-- ListView外のページャー --%>
            <asp:DataPager ID="DataPager2" runat="server" PagedControlID="list" PageSize="3">
               <Fields>
                 <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
               </Fields>
            </asp:DataPager>

            <%-- データソース --%>
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
