<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormViewCustom.aspx.vb" Inherits="SelfAspNetVb.FormViewCustom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FormViewコントロール</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="fv" runat="server" AllowPaging="True" CellPadding="4" 
            DataKeyNames="isbn" DataSourceID="sds" ForeColor="#333333">
            <EditItemTemplate>
                ISBNコード：<br /> 
                <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                <br />
                書名：<br /> 
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                単価：<br /> 
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                出版社：<br /> 
                <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
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
                <asp:RegularExpressionValidator ID="regIsbn" runat="server" 
                    ControlToValidate="isbnTextBox" ErrorMessage="ISBNは正しい形式で入力してください。" 
                    CssClass="valid" SetFocusOnError="True" 
                    ValidationExpression="978-4-\d{3,5}-\d{3,5}-[a-zA-Z0-9]" 
                    ValidationGroup="MyValid">*</asp:RegularExpressionValidator>
                <br />
                書名：<br /> 
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                単価：<br /> 
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <asp:RangeValidator ID="rngPrice" runat="server" 
                    ControlToValidate="priceTextBox" CssClass="valid" 
                    ErrorMessage="価格は0～10000円の範囲で入力してください。" MaximumValue="10000" MinimumValue="0" 
                    SetFocusOnError="True" Type="Integer" ValidationGroup="MyValid">*</asp:RangeValidator>
                <br />
                出版社：<br />                  
                <asp:DropDownList ID="ddl" runat="server" DataSourceID="sds" 
                    DataTextField="publish" DataValueField="publish" 
                  SelectedValue='<%# Bind("publish") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
                    SelectCommand="SELECT DISTINCT [publish] FROM [Book]"></asp:SqlDataSource>
                <br />
                発売日：<br /> 
                <asp:TextBox ID="publishedTextBox" runat="server" 
                    Text='<%# Bind("published") %>' />
                <asp:CompareValidator ID="cmpPublished" runat="server" 
                    ControlToValidate="publishedTextBox" CssClass="valid" 
                    ErrorMessage="発売日は日付形式で入力してください。" Operator="DataTypeCheck" 
                    SetFocusOnError="True" Type="Date" ValidationGroup="MyValid">*</asp:CompareValidator>
                <br />
                CD-ROM：<asp:CheckBox ID="cdromCheckBox" runat="server" 
                    Checked='<%# Bind("cdrom") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="挿入" ValidationGroup="MyValid" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="キャンセル" />
                <br />
                <asp:ValidationSummary ID="summary" runat="server" CssClass="valid" 
                    ValidationGroup="MyValid" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Image ID="img" runat="server" AlternateText='<%# Eval("title") %>' 
                    Height="160px" 
                    ImageUrl='<%# Eval("isbn", "http://www.wings.msn.to/books/{0}/{0}.jpg") %>' 
                    Width="110px" />
                <br />
                ISBNコード：<br /> 
                <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                <br />
                書名：<br /> 
                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                <br />
                単価：<br /> 
                <asp:Label ID="priceLabel" runat="server" 
                    Text='<%# Eval("price", "{0:#,###円}") %>' />
                <br />
                出版社：<br /> 
                <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                <br />
                発売日：<br /> 
                <asp:Label ID="publishedLabel" runat="server" 
                    Text='<%# Eval("published", "{0:yyyy年MM月dd日}") %>' />
                <br />
                CD-ROM：<asp:CheckBox ID="cdromCheckBox" runat="server" 
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
