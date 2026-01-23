<%@ Page Title="電話番号を確認する" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyPhoneNumber.aspx.cs" Inherits="SelfAspNetIdentity.Account.VerifyPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>。</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div>
            <h4>確認コードを入力する</h4>
            <hr />
            <asp:HiddenField runat="server" ID="PhoneNumber" />
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <div class="row">
                <asp:Label runat="server" AssociatedControlID="Code" CssClass="col-md-2 col-form-label">コード</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Code" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Code"
                        CssClass="text-danger" ErrorMessage="[コード] フィールドは必須です。" />
                </div>
            </div>
            <div class="row">
                <div class="offset-md-2 col-md-10">
                    <asp:Button runat="server" OnClick="Code_Click"
                        Text="送信" CssClass="btn btn-outline-dark" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
