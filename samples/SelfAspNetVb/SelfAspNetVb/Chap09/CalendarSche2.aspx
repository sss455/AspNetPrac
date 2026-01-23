<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CalendarSche2.aspx.vb" Inherits="SelfAspNetVb.CalendarSche2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Calendarコントロール</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Calendar ID="cal" runat="server" BackColor="White" BorderColor="Black" 
            BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" 
            ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <asp:SqlDataSource ID="sds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SelfAsp %>" 
            ProviderName="System.Data.SqlClient" 
            
            SelectCommand="SELECT sdate, subject + ' ' + stime + '～' AS item, uid FROM Schedule WHERE (uid = @uid) ORDER BY sdate, stime">
            <SelectParameters>
                <asp:Parameter DefaultValue="yyamada" Name="uid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
