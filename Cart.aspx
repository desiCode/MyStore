<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MyStore.Cart" %>
<%--CART.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for displaying the products that are added to cart by the User --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centre" runat="server">

    <asp:GridView runat="server" ID="incart" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" GridLines="None" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product Name
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="prodName" Text='<%#Eval("Name") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Product Price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="ProdPrice" Text='<%#Eval("Price") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                   Remove Product
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" ID="removeProd" Text="Remove" CommandArgument='<%#Eval("ID") %>' OnClick="removeProd_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <table>
        <tr>
            <td>
                Total Price &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" ID="totalPrice" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button runat="server" ID="BuyButton" Text="Buy Now" OnClick="BuyButton_Click" />
            </td>
            <td>
                <asp:Button runat="server" ID="continueshopp" Text="Continue Shopping" OnClick="continueshopp_Click" />
            </td>
        </tr>
    </table>
  <%--  This page represents the users shopping cart. This page is not accessible until the user logs into the system.

When an item is ‘Added to the Cart’ from the ~/ProductDetails.aspx page it should appear on this page. 

The user should be able to remove items from the cart. 
The cart allows only a single item of any type to be purchased in a single transaction. 
This page shows the total amount of all of the items being purchased. 
This page requires a ‘Buy Now’ button. When the ‘Buy Now’ button is pressed the user is redirected to ~/Checkout.aspx. 
This page requires a ‘Continue Shopping’ button that redirects the user to ~/Default.aspx

This page inherits from MasterPage.Master--%>


</asp:Content>
