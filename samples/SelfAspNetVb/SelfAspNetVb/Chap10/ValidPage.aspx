<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ValidPage.aspx.vb" Inherits="SelfAspNetVb.ValidPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検証コントロール</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        名前：<br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqName" runat="server" 
            ControlToValidate="txtName" ErrorMessage="名前" 
            CssClass="valid"></asp:RequiredFieldValidator>
        <br />
        体重：<br />
        <asp:TextBox ID="txtWeight" runat="server" Columns="5"></asp:TextBox>
        Kg<asp:RangeValidator ID="rngWeight" runat="server" 
            ControlToValidate="txtWeight" ErrorMessage="体重" 
            MaximumValue="300" MinimumValue="0" Type="Integer" 
            CssClass="valid"></asp:RangeValidator>
        <br />
        誕生日：<br />
        <asp:TextBox ID="txtBirth" runat="server" Columns="10"></asp:TextBox>
        <asp:CompareValidator ID="cmpBirth" runat="server" ControlToValidate="txtBirth" 
            ErrorMessage="誕生日" Operator="DataTypeCheck" Type="Date" CssClass="valid"></asp:CompareValidator>
        <br />
        E-Mail：<br />
        <asp:TextBox ID="txtEmail" runat="server" Columns="50"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regEmail" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="E-Mail" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            CssClass="valid"></asp:RegularExpressionValidator>
        <br />
        E-Mail（確認）：<br />
        <asp:TextBox ID="txtEmail2" runat="server" Columns="50"></asp:TextBox>
        <asp:CompareValidator ID="cmpEmail2" runat="server" ControlToCompare="txtEmail" 
            ControlToValidate="txtEmail2" ErrorMessage="Email,Email（確認）" 
            CssClass="valid"></asp:CompareValidator>
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="決定" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    
        <br />
        <asp:ValidationSummary ID="summary" runat="server" CssClass="valid" />
    </div>
    </form>
</body>
</html>
