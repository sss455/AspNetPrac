<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart2.aspx.cs" Inherits="SelfAspNet.Chap09.Chart2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Chart ID="cht" runat="server" BackColor="PapayaWhip" BackGradientStyle="TopBottom" DataSourceID="sds" Height="250px" Width="500px">
                <Series>
                    <asp:Series Name="Series1" XValueMember="dating" YValueMembers="volume" YAxisType="Secondary"></asp:Series>
                    <asp:Series ChartArea="ChartArea1" ChartType="Candlestick" Color="Black" Name="Series2" XValueMember="dating" YValueMembers="high, low, opening, closing" YValuesPerPoint="4">
                    </asp:Series>
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="White">
                        <AxisY Maximum="1600" Minimum="800" Title="株価">
                        </AxisY>
                        <AxisX Title="日付">
                        </AxisX>
                        <AxisY2 Maximum="2000" Minimum="200" Title="出来高">
                        </AxisY2>
                    </asp:ChartArea>
                </ChartAreas>

                <Titles>
                    <asp:Title Name="Title1" Text="今月の株価情報">
                    </asp:Title>
                </Titles>
            </asp:Chart>

            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfAsp %>" SelectCommand="SELECT [opening], [dating], [high], [low], [closing], [volume] FROM [Stock] WHERE ([brand] = @brand) ORDER BY [dating]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="28710" Name="brand" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
