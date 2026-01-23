<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ObjectParam2.aspx.vb" Inherits="SelfAspNetVb.ObjectParam2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ObjectDataSourceコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:RadioButtonList ID="list" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="sds_list" DataTextField="category" 
            DataValueField="category" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">無選択</asp:ListItem>
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="sds_list" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
            SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]">
        </asp:SqlDataSource>
        <asp:GridView ID="grid" runat="server" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ods" 
            ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" 
            DataKeyNames="aid">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="aid" DataNavigateUrlFormatString="http://www.wings.msn.to/album/{0}"
                    DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
                <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" DataImageUrlFormatString="~/Image/{0}.jpg"
                    HeaderText="画像" ReadOnly="True">
                    <ControlStyle Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="category" HeaderText="分類" SortExpression="category" />
                <asp:BoundField DataField="comment" HeaderText="備考" SortExpression="comment" />
                <asp:BoundField DataField="updated" DataFormatString="{0:yyyy年MM月dd日(ddd)}" HeaderText="最終更新日"
                    HtmlEncode="False" SortExpression="updated" />
                <asp:CheckBoxField DataField="favorite" HeaderText="お気に入り" SortExpression="favorite" />
                <asp:CommandField ButtonType="Button" HeaderText="削除" ShowDeleteButton="True" />
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
        <asp:ObjectDataSource ID="ods" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlbumData" TypeName="SelfAspNetVb.AlbumDataSetTableAdapters.AlbumTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_aid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="aid" Type="String" />
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="updated" Type="DateTime" />
                <asp:Parameter Name="favorite" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="list" Name="category" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="category" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="updated" Type="DateTime" />
                <asp:Parameter Name="favorite" Type="Boolean" />
                <asp:Parameter Name="Original_aid" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
