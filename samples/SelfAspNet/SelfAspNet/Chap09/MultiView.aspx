<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiView.aspx.cs" Inherits="SelfAspNet.Chap09.MultiView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MultiViewコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
                <asp:View ID="v1" runat="server">
                    <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="valid"
                        DataKeyNames="aid" DataSourceID="sds" ForeColor="Black"
                        GridLines="Vertical" OnSelectedIndexChanged="grid_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True"
                                SortExpression="aid" />
                            <asp:BoundField DataField="category" HeaderText="category"
                                SortExpression="category" />
                            <asp:BoundField DataField="comment" HeaderText="comment"
                                SortExpression="comment" />
                            <asp:BoundField DataField="updated" HeaderText="updated"
                                SortExpression="updated" />
                            <asp:CheckBoxField DataField="favorite" HeaderText="favorite"
                                SortExpression="favorite" />
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
                        DeleteCommand="DELETE FROM [Album] WHERE [aid] = @aid"
                        InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)"
                        ProviderName="<%$ ConnectionStrings:SelfAsp.ProviderName %>"
                        SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album]"
                        UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @aid">
                        <DeleteParameters>
                            <asp:Parameter Name="aid" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="aid" Type="String" />
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter DbType="Date" Name="updated" />
                            <asp:Parameter Name="favorite" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter DbType="Date" Name="updated" />
                            <asp:Parameter Name="favorite" Type="Boolean" />
                            <asp:Parameter Name="aid" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="v2" runat="server">
                    <asp:FormView ID="fv" runat="server" AllowPaging="True" CellPadding="4"
                        DataKeyNames="aid" DataSourceID="sdsDetail" ForeColor="#333333">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl='<%# Eval("aid", "~/Image/{0}.jpg") %>' />
                            <br />
                            アルバムコード:
                        <asp:Label ID="aidLabel1" runat="server" Text='<%# Eval("aid") %>' />
                            <br />
                            分類:
                        <asp:TextBox ID="categoryTextBox" runat="server"
                            Text='<%# Bind("category") %>' />
                            <br />
                            備考:
                        <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
                            <br />
                            最終更新日:
                        <asp:TextBox ID="updatedTextBox" runat="server" Text='<%# Bind("updated") %>' />
                            <br />
                            お気に入り:
                        <asp:CheckBox ID="favoriteCheckBox" runat="server"
                            Checked='<%# Bind("favorite") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            私のアルバム
                        </HeaderTemplate>
                        <InsertItemTemplate>
                            アルバムコード:
                        <asp:TextBox ID="aidTextBox" runat="server" Text='<%# Bind("aid") %>' />
                            <br />
                            分類:
                        <asp:TextBox ID="categoryTextBox0" runat="server"
                            Text='<%# Bind("category") %>' />
                            <br />
                            備考:
                        <asp:TextBox ID="commentTextBox0" runat="server"
                            Text='<%# Bind("comment") %>' />
                            <br />
                            最終更新日:
                        <asp:TextBox ID="updatedTextBox0" runat="server"
                            Text='<%# Bind("updated") %>' />
                            <br />
                            お気に入り:
                        <asp:CheckBox ID="favoriteCheckBox0" runat="server"
                            Checked='<%# Bind("favorite") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                CommandName="Insert" Text="挿入" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"
                                CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img" runat="server"
                                ImageUrl='<%# Eval("aid", "~/Image/{0}.jpg") %>' />
                            <br />
                            アルバムコード:
                        <asp:Label ID="aidLabel" runat="server" Text='<%# Eval("aid") %>' />
                            <br />
                            分類:
                        <asp:Label ID="categoryLabel" runat="server" Text='<%# Bind("category") %>' />
                            <br />
                            備考:
                        <asp:Label ID="commentLabel" runat="server" Text='<%# Bind("comment") %>' />
                            <br />
                            最終更新日:
                        <asp:Label ID="updatedLabel" runat="server"
                            Text='<%# Eval("updated", "{0:yyyy/MM/dd}") %>' />
                            <br />
                            お気に入り:
                        <asp:CheckBox ID="favoriteCheckBox1" runat="server"
                            Checked='<%# Bind("favorite") %>' Enabled="false" />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                                CommandName="Edit" Text="編集" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                CommandName="Delete" Text="削除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False"
                                CommandName="New" Text="新規作成" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="sdsDetail" runat="server"
                        ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                        DeleteCommand="DELETE FROM [Album] WHERE [aid] = @aid"
                        InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)"
                        SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album] WHERE ([aid] = @aid)"
                        UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @aid">
                        <DeleteParameters>
                            <asp:Parameter Name="aid" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="aid" Type="String" />
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter DbType="Date" Name="updated" />
                            <asp:Parameter Name="favorite" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="grid" Name="aid" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="category" Type="String" />
                            <asp:Parameter Name="comment" Type="String" />
                            <asp:Parameter DbType="Date" Name="updated" />
                            <asp:Parameter Name="favorite" Type="Boolean" />
                            <asp:Parameter Name="aid" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnList" runat="server" CommandName="PrevView" Text="一覧へ" />
                </asp:View>
            </asp:MultiView>

        </div>
    </form>
</body>
</html>
