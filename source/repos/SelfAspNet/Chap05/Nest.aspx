<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nest.aspx.cs" Inherits="SelfAspNet.Chap05.Nest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds">
                <Columns>
                    <%-- 分類 --%>
                    <asp:BoundField DataField="category" HeaderText="分類" SortExpression="category" />
                    <%-- TemplateField --%>
                    <asp:TemplateField>
                        <%-- ItemTemplate --%>
                        <ItemTemplate>
                            <!-- HiddenField -->
                            <asp:HiddenField ID="hdnDetails" runat="server" Value='<%# Eval("category") %>' />
                            <!-- GridView -->
                            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="aid" DataSourceID="sds" EmptyDataText="カテゴリは選択されていません。" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:HyperLinkField DataNavigateUrlFields="aid" DataNavigateUrlFormatString="https://wings.msn.to/album/{0}" DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
                                    <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" DataImageUrlFormatString="~/Image/{0}.jpg" HeaderText="画像" ReadOnly="True">
                                        <ControlStyle Height="40px" Width="40px" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="category" HeaderText="分類" SortExpression="category" />
                                    <asp:BoundField DataField="comment" HeaderText="備考" SortExpression="comment" />
                                    <asp:BoundField DataField="updated" DataFormatString="{0:yyyy年MM月dd日(ddd)}" HeaderText="最終更新日" SortExpression="updated" />
                                    <asp:CheckBoxField DataField="favorite" HeaderText="お気に入り" SortExpression="favorite" />
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
                            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album] WHERE ([category] = @category)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdnDetails" Name="category" PropertyName="Value" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
