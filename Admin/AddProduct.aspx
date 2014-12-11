<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="MyStore.Admin.AddProduct" %>
<%--ADDPRODUCTS.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for displaying the products that are on Sale.c User can login the site to shop around--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="centre" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="right" runat="server">
    <%--This area allows the administrator to add a product to your database. 

In your database store the following information about Products

ProductId, int, identity, primary key
CategoryId, int, not null
Name, varchar(255), not null
ShortDescription, varchar(512) , not null
LongDescription, varchar(MAX) , not null
Price, decimal, not null
SalePrice, decimal, not null
IsOnSale, bit, not null
ImageName, varchar(255), not null

Design a form to collect the appropriate information and save it in the database. 

The LongDescription must be collected using the AJAX HTHMEditor control
The CategoryId must be collected using a drop down list of all available Categories in the system
Everything else is up to you

Use the lessons learned in Lab 7 task 2 to allow the administrator to upload and save a product image into Azure Storage and retrieve the image using a Generic Handler.

This page inherits from MasterPageAdminMenu.Master--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="left" runat="server">
    <%@ Register TagPrefix="aja" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
    <aja:ToolkitScriptManager runat="server" />

    <table style="width: 100%">

        <tr>
            <td>Category List</td>
            <td>
                <asp:DropDownList runat="server" ID="catList" AutoPostBack="false" AppendDataBoundItems="True"
                    DataTextField="CategoryName">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="ProductName" Text="" runat="server" Width="200px" />
                <asp:RequiredFieldValidator runat="server" ID="rfV" ControlToValidate="ProductName" ErrorMessage="*" />
            </td>
        </tr>
        <tr>
            <td>Product Price</td>
            <td>
                <asp:TextBox runat="server" ID="pPrice" Text="" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="pPrice" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ID="rqfv" ControlToValidate="pPrice" ValidationExpression="^[0-9.0-9]+" ErrorMessage="Invalid Entry" />
            </td>
        </tr>
        <tr>
            <td>Product Sale Price</td>
            <td>
                <asp:TextBox runat="server" ID="salePrice" Text="" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="salePrice" ErrorMessage="*" />
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="salePrice" ValidationExpression="^[0-9.0-9]+" ErrorMessage="Invalid Entry" />
            </td>
        </tr>
        <tr>
            <td>On Sale?</td>
            <td>
                <asp:CheckBox runat="server" ID="isOnSale" Text="IsOnSale" />
            </td>
        </tr>
        <tr>
            <td>Upload Picture</td>
            <td>
                <asp:FileUpload runat="server" ID="file_upload" />
            </td>
        </tr>
        <tr>
            <td>Short Description</td>
            <td>
                <asp:TextBox ID="shortdes" runat="server" Text="" TextMode="MultiLine" Height="200" Width="300" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="shortdes" ErrorMessage="*" />
                <aja:HtmlEditorExtender runat="server" ID="html" TargetControlID="shortdes" EnableSanitization="false" />
            </td>
        </tr>
        <tr>
            <td>Long Description</td>
            <td>
                <asp:TextBox runat="server" ID="longdes" Text="" TextMode="MultiLine" Width="400" Height="250" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="longdes"  ErrorMessage="*" />
                <aja:HtmlEditorExtender runat="server" ID="HtmlEditorExtender1" TargetControlID="longdes" EnableSanitization="false" />
            </td>
        </tr>
        <tr>
            <td>Submit</td>
            <td>
                <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="errormessage" />
            </td>
        </tr>
    </table>
</asp:Content>
