<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SqlStored2.aspx.cs" Inherits="SelfAspNet.Chap05.SqlStored2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SqlDataSourceコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:RadioButtonList ID="list" runat="server" AppendDataBoundItems="True"
                AutoPostBack="True" DataSourceID="sds_list" DataTextField="category"
                DataValueField="category" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">無選択</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblNum" runat="server"></asp:Label>
            件のデータが取得されました。<asp:SqlDataSource ID="sds_list" runat="server"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]"></asp:SqlDataSource>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" DataKeyNames="aid" DataSourceID="sds"
                EmptyDataText="カテゴリは選択されていません。" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="aid" DataNavigateUrlFormatString="https://wings.msn.to/album/{0}"
                        DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
                    <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" DataImageUrlFormatString="~/Image/{0}.jpg"
                        HeaderText="画像" ReadOnly="True">
                        <ControlStyle Height="40px" Width="40px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="category" HeaderText="分類" SortExpression="category" />
                    <asp:BoundField DataField="comment" HeaderText="備考" SortExpression="comment" />
                    <asp:BoundField DataField="updated" DataFormatString="{0:yyyy年MM月dd日(ddd)}" HeaderText="最終更新日"
                        SortExpression="updated" />
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
            <asp:SqlDataSource ID="sds" runat="server"
                ConnectionString="<%$ ConnectionStrings:SelfAsp %>"
                SelectCommand="AlbumFilter2" SelectCommandType="StoredProcedure"
                OnSelected="sds_Selected">
                <SelectParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:ControlParameter ControlID="list" Name="category"
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
