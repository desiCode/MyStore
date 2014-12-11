<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="MyStore.CategoryDetails" %>
<%--CATEGORYDETAILS.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for displaying all the products in the selected Category User can click on the product name to navigate to the details of the product --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centre" runat="server">

    <asp:GridView runat="server" ID="categoryView" AutoGenerateColumns="false" EmptyDataText="Please Add categories" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product Name
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Namelink" Text='<%#Eval("Name") %>' OnClick="Namelink_Click" CommandArgument='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Regular Price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="categoryLabel" runat="server" Text='<%#Eval("Price") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product SalePrice
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="salepriceLabel" runat="server" Text='<%#Eval("SalePrice") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product Image
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Image runat="server" ID="PImage" ImageUrl='<%# "~/GetImage.ashx?prodID=" + Eval("ID") %>' Width="300" Height="300" />

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product Description
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="shrotdesc" Text='<%#Eval("ShortDescription") %>' TextMode="MultiLine" Enabled="false"  Width="300" Height="300" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <%--    This page is a landing page for your stores ‘Categories’. Each item, when added to the store, must belong to a 
    Category. For example, the iPhone and Nexus Phone would belong to the ‘Mobile Phone’ category. 
    Categories are defined in the administration area.

When a user clicks on a category on the MasterPageMenu.Master master page they are redirected to ~/CategoryDetails.aspx 
    and the category id is passed to the page using the request string.

When the user lands on this page you will display all of the items that belong to this category. Paging is not required.

When a user clicks on an item’s name they are redirected to ~/ProductDetails.aspx with the product id in the Request 
    string. Display the following product values:

Name
Regular Price
Sale Price
Image
Short Description

This page inherits from MasterPageMenu.Master--%>
</asp:Content>
