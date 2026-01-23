<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="SelfAspNet.Chap09.Chart" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Chartコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Chart ID="cht" runat="server" BackColor="PapayaWhip" BackGradientStyle="TopBottom" DataSourceID="sds" Height="250px" style="margin-bottom: 0px" Width="500px">
                <series>
                    <asp:Series Name="Series1" XValueMember="dating" YValueMembers="volume">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea BackColor="White" Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
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
