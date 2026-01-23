<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SqlOpti.aspx.cs" Inherits="SelfAspNet.Chap05.SqlOpti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SqlDataSourceコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="lblError" runat="server"></asp:Label>

            <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="aid"
                DataSourceID="sds" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
            <asp:SqlDataSource ID="sds" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                DeleteCommand="DELETE FROM [Album] WHERE [aid] = @original_aid AND [category] = @original_category AND [comment] = @original_comment AND [updated] = @original_updated AND [favorite] = @original_favorite"
                InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)"
                OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album]"
                UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @original_aid AND [category] = @original_category AND [comment] = @original_comment AND [updated] = @original_updated AND [favorite] = @original_favorite"
                OnUpdated="sds_Updated">
                <DeleteParameters>
                    <asp:Parameter Name="original_aid" Type="String" />
                    <asp:Parameter Name="original_category" Type="String" />
                    <asp:Parameter Name="original_comment" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_updated" />
                    <asp:Parameter Name="original_favorite" Type="Boolean" />
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
                    <asp:Parameter Name="original_aid" Type="String" />
                    <asp:Parameter Name="original_category" Type="String" />
                    <asp:Parameter Name="original_comment" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_updated" />
                    <asp:Parameter Name="original_favorite" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
