<%@ Page Title="マスターページ" Language="vb" AutoEventWireup="false" MasterPageFile="~/Chap10/MyApp.Master" CodeBehind="Content.aspx.vb" Inherits="SelfAspNetVb.Content" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="server">
    <asp:GridView ID="grid" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="aid" 
            DataSourceID="sds" ForeColor="Black" GridLines="Vertical" PageSize="3" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="aid" 
                    DataNavigateUrlFormatString="http://www.wings.msn.to/album/{0}" 
                    DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
            <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" 
                    DataImageUrlFormatString="~/Image/{0}.jpg" HeaderText="画像" ReadOnly="True">
                <ControlStyle Height="40px" Width="40px" />
            </asp:ImageField>
            <asp:BoundField DataField="category" HeaderText="分類" 
                    SortExpression="category" />
            <asp:BoundField DataField="comment" HeaderText="備考" 
                    SortExpression="comment" />
            <asp:BoundField DataField="updated" HeaderText="最終更新日" 
                    SortExpression="updated" DataFormatString="{0:yyyy年MM月dd日(ddd)}" />
            <asp:CheckBoxField DataField="favorite" HeaderText="お気に入り" 
                    SortExpression="favorite" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ButtonType="Button" HeaderText="編集／削除" />
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
</asp:Content>
