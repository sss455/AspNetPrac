<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MultiViewBook.aspx.vb" Inherits="SelfAspNetVb.MultiViewBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
            <asp:View ID="v1" runat="server">
                <asp:GridView ID="grid" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="isbn" 
                    DataSourceID="sds" ForeColor="Black" GridLines="Vertical" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="書名" SortExpression="title" />
                        <asp:BoundField DataField="publish" HeaderText="出版社" SortExpression="publish" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
            </asp:View>
            <asp:View ID="v2" runat="server">
                <asp:FormView ID="fv" runat="server" AllowPaging="True" CellPadding="4" 
                    DataKeyNames="isbn" DataSourceID="sds0" ForeColor="#333333">
                    <EditItemTemplate>
                        ISBNコード：<br /> 
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名：<br /> 
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        出版社：<br /> 
                        <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />
                        単価：<br /> 
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        発売日：<br /> 
                        <asp:TextBox ID="publishedTextBox" runat="server" 
                            Text='<%# Bind("published", "{0:yyyy/MM/dd}") %>' />
                        <br />
                        CD-ROM：<asp:CheckBox ID="cdromCheckBox" runat="server" 
                            Checked='<%# Bind("cdrom") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新" />
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="キャンセル" />
                    </EditItemTemplate>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        書籍情報フォーム
                    </HeaderTemplate>
                    <InsertItemTemplate>
                        ISBNコード：<br /> 
                        <asp:TextBox ID="isbnTextBox" runat="server" Text='<%# Bind("isbn") %>' />
                        <br />
                        書名：<br /> 
                        <asp:TextBox ID="titleTextBox0" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        出版社：<br /> 
                        <asp:TextBox ID="publishTextBox0" runat="server" 
                            Text='<%# Bind("publish") %>' />
                        <br />
                        単価：<br /> 
                        <asp:TextBox ID="priceTextBox0" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        発売日：<br /> 
                        <asp:TextBox ID="publishedTextBox0" runat="server" 
                            Text='<%# Bind("published") %>' />
                        <br />
                        CD-ROM：<asp:CheckBox ID="cdromCheckBox0" runat="server" 
                            Checked='<%# Bind("cdrom") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="挿入" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="キャンセル" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img" runat="server" AlternateText='<%# Eval("title") %>' 
                            Height="160px" 
                            ImageUrl='<%# Eval("isbn", "http://www.wings.msn.to/books/{0}/{0}.jpg") %>' 
                            Width="110px" />
                        <br />
                        ISBNコード：<br /> 
                        <asp:Label ID="isbnLabel0" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />
                        書名：<br /> 
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        出版社：<br /> 
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />
                        単価：<br /> 
                        <asp:Label ID="priceLabel" runat="server" 
                            Text='<%# Eval("price", "{0:#,###円}") %>' />
                        <br />
                        発売日：<br /> 
                        <asp:Label ID="publishedLabel" runat="server" 
                            Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                        <br />
                        CD-ROM：<asp:CheckBox ID="cdromCheckBox1" runat="server" 
                            Checked='<%# Eval("cdrom") %>' Enabled="False" />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="編集" />
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="削除" />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="新規作成" />
                    </ItemTemplate>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:FormView>
                <asp:SqlDataSource ID="sds0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
                    DeleteCommand="DELETE FROM [Book] WHERE [isbn] = @isbn" 
                    InsertCommand="INSERT INTO [Book] ([isbn], [title], [price], [publish], [published], [cdrom]) VALUES (@isbn, @title, @price, @publish, @published, @cdrom)" 
                    SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book] WHERE ([isbn] = @isbn)" 
                    UpdateCommand="UPDATE [Book] SET [title] = @title, [price] = @price, [publish] = @publish, [published] = @published, [cdrom] = @cdrom WHERE [isbn] = @isbn">
                    <DeleteParameters>
                        <asp:Parameter Name="isbn" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="isbn" />
                        <asp:Parameter Name="title" />
                        <asp:Parameter Name="price" />
                        <asp:Parameter Name="publish" />
                        <asp:Parameter Name="published" />
                        <asp:Parameter Name="cdrom" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grid" Name="isbn" PropertyName="SelectedValue" 
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" />
                        <asp:Parameter Name="price" />
                        <asp:Parameter Name="publish" />
                        <asp:Parameter Name="published" />
                        <asp:Parameter Name="cdrom" />
                        <asp:Parameter Name="isbn" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnList" runat="server" CommandName="PrevView" Text="一覧へ" />
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
