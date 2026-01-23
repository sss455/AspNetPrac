<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Chart.aspx.vb" Inherits="SelfAspNetVb.Chart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Chartコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Chart ID="cht" runat="server" BackColor="PapayaWhip" BackGradientStyle="TopBottom" DataSourceID="sds" Height="250px" Width="500px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="dating" YValueMembers="volume">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea BackColor="White" Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Titles>
                    <asp:Title Name="Title1" Text="今月の株価情報">
                    </asp:Title>
                </Titles>
            </asp:Chart>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" SelectCommand="SELECT [dating], [opening], [high], [low], [closing], [volume] FROM [Stock] WHERE ([brand] = @brand) ORDER BY [dating]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="28710" Name="brand" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
