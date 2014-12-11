<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MyStore.Admin.AddCategory" %>
<%--ADDCATEGORY.ASPX
    Created by Lovejot Singh  2014
    This page is allows the user to add new categories to the database --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="left" runat="server">

      <table style="width: 100%">
        <tr>
            <td>Add Category</td>
            <td>
                <asp:TextBox ID="addCategory" runat="server" />
                <asp:RequiredFieldValidator ID="rfcat" runat="server" ControlToValidate="addCategory" ErrorMessage="* Missing" />
                <asp:RegularExpressionValidator runat="server" ID="regexCat" ControlToValidate="addCategory" ValidationExpression="^[a-zA-Z]+" ErrorMessage="Alphabets Only" />
            </td>
        </tr>
          <tr>
            <td></td>
            <td>
                <asp:Button ID="submit" runat="server" Text="Submit" OnClick="addcat_Click" />
            </td>
        </tr>
    </table>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="right" runat="server">
    <asp:GridView ID="catview" runat="server" AutoGenerateColumns="false" EmptyDataText="Nothing Yet" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Category
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("CategoryName") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   <%-- This area allows the administrator to create new product Categories. For example, iPhone and Nexus phones might belong to a ‘Mobile Phone’ category.

In your database store the following information about Categories

CategoryId, int, identity, primary key
Name, varchar(255)

Design a form to collect the appropriate information and save it in the database.

This page inherits from MasterPageAdminMenu.Master--%>

</asp:Content>
