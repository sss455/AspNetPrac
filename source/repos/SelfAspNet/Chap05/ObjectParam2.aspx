<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObjectParam2.aspx.cs" Inherits="SelfAspNet.Chap05.ObjectParam2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:RadioButtonList ID="list" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sds_list" DataTextField="category" DataValueField="category" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">無選択</asp:ListItem>
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="sds_list" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]"></asp:SqlDataSource>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="ods" EmptyDataText="カテゴリは選択されていません。" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True" SortExpression="aid" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                    <asp:BoundField DataField="updated" HeaderText="updated" SortExpression="updated" />
                    <asp:CheckBoxField DataField="favorite" HeaderText="favorite" SortExpression="favorite" />
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

            <asp:ObjectDataSource ID="ods" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlbumData" TypeName="SelfAspNet.Chap05.AlbumDataSetTableAdapters.AlbumTableAdapter" UpdateMethod="Update">
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
