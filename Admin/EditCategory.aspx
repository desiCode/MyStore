<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="MyStore.Admin.EditCategory" %>
<%--EDITCATEGORY.ASPX
    Created by Lovejot Singh  2014
    This page allows user to edit category by changing the name of the category --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="left" runat="server">
    <%-- This area allows the administrator to edit an existing product Category. This page should be able to edit the ‘Name’ column of your category table.

This page inherits from MasterPageAdminMenu.Master--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">


    <table>
         <tr>
            <td>
               Old Label
            </td>
            <td>
                New Label
            </td>
            <td>
             Button
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label runat="server" ID="oldlabel" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="newLabel" Text="" />
            </td>
            <td>
                <asp:Button runat="server" ID="submit" Text="Submit" OnClick="edit_cat" />
            </td>
        </tr>
    </table>
    <br />
   


</asp:Content>
