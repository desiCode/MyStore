<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="BadWords.aspx.cs" Inherits="MyStore.Admin.BadWords" %>
<%--BADWORDS.ASPX
    Created by Lovejot Singh  2014
    This page is allows user to add badwords to the database that will be filtered when user comments on the products page--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="left" runat="server">

<%--This page inherits from MasterPageAdminMenu.Master--%>
    <asp:GridView runat="server" ID="badGrid" EmptyDataText="No Words here" AutoGenerateColumns="false" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>BadWord</HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("Word") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="right" runat="server">

    <table style="width: 100%">
        <tr>
            <td>Add BadWord</td>
            <td>
                <asp:TextBox ID="addBword" runat="server" />
                <asp:RequiredFieldValidator ID="rfcat" runat="server" ControlToValidate="addBword" ErrorMessage="* Missing" />
                <asp:RegularExpressionValidator runat="server" ID="regexCat" ControlToValidate="addBword" ValidationExpression="^[a-zA-Z]+" ErrorMessage="Alphabets Only" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
            </td>
        </tr>
       
    </table>

</asp:Content>
