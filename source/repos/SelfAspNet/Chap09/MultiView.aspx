<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiView.aspx.cs" Inherits="SelfAspNet.Chap09.MultiView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- MultiView --%>
            <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">


                <%-- View1 --%>
                <asp:View ID="v1" runat="server">
                    <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="aid" DataSourceID="sds" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grid_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True" SortExpression="aid" />
                            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                            <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                            <asp:BoundField DataField="updated" HeaderText="updated" SortExpression="updated" />
                            <asp:CheckBoxField DataField="favorite" HeaderText="favorite" SortExpression="favorite" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" DeleteCommand="DELETE FROM [Album] WHERE [aid] = @aid" InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album]" UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @aid">
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


                <%-- View2 --%>
                <asp:View ID="v2" runat="server">
                    <asp:FormView ID="fv" runat="server" CellPadding="4" DataKeyNames="aid" DataSourceID="sdsDetail" ForeColor="#333333" AllowPaging="True">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("aid", "~/Image/{0}.jpg") %>' />
                            <br />
                            アルバムコード:
                            <asp:Label ID="aidLabel1" runat="server" Text='<%# Eval("aid") %>' />
                            <br />
                            分類:
                            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                            <br />
                            備考:
                            <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
                            <br />
                            最終更新日:
                            <asp:TextBox ID="updatedTextBox" runat="server" Text='<%# Bind("updated", "{0:yyyy/MM/dd}") %>' />
                            <br />
                            お気に入り:
                            <asp:CheckBox ID="favoriteCheckBox" runat="server" Checked='<%# Bind("favorite") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#999999" />

                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

                        <HeaderTemplate>
                            アルバム
                        </HeaderTemplate>

                        <InsertItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("aid", "~/Image/{0}.jpg") %>' />
                            <br />
                            アルバムコード:
                            <asp:TextBox ID="aidTextBox" runat="server" Text='<%# Bind("aid") %>' />
                            <br />
                            分類:
                            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                            <br />
                            備考:
                            <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
                            <br />
                            最終更新日:
                            <asp:TextBox ID="updatedTextBox" runat="server" Text='<%# Bind("updated", "{0:yyyy/MM/dd}") %>' />
                            <br />
                            お気に入り:
                            <asp:CheckBox ID="favoriteCheckBox" runat="server" Checked='<%# Bind("favorite") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="挿入" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                        </InsertItemTemplate>

                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("aid", "~/Image/{0}.jpg") %>' />
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
                            <asp:Label ID="updatedLabel" runat="server" Text='<%# Bind("updated", "{0:yyyy/MM/dd}") %>' />
                            <br />
                            お気に入り:
                            <asp:CheckBox ID="favoriteCheckBox" runat="server" Checked='<%# Bind("favorite") %>' Enabled="false" />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編集" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="削除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新規作成" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>

                    <asp:SqlDataSource ID="sdsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" DeleteCommand="DELETE FROM [Album] WHERE [aid] = @aid" InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album] WHERE ([aid] = @aid)" UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @aid">
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
                            <asp:ControlParameter ControlID="grid" Name="aid" PropertyName="SelectedValue" Type="String" />
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
