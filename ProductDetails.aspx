<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="MyStore.ProductDetails" %>
<%--PRODUCTDETAILS.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for displaying the product that has been selected by the user in Categorydetails page The user gets to see the long description of the product 
    on this page.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="centre" runat="server">
    <%@ Register TagPrefix="aja" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
    <aja:ToolkitScriptManager runat="server" />
   
     <asp:LinkButton runat="server" ID="addtocart" OnClick="addtocart_Click" Text="AddToCart" />
    
    
    <asp:GridView runat="server" ID="productDetails" AutoGenerateColumns="false" EmptyDataText="Please Add categories">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Name
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="nameLabel" runat="server" Text='<%#Eval("Name") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="priceLabel" runat="server" Text='<%#Eval("Price") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Sale Price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="salepriceLabel" runat="server" Text='<%#Eval("SalePrice") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Short Description
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="shortdescLabel" runat="server" Enabled="false" Text='<%#Eval("ShortDescription") %>' TextMode="MultiLine" Height="300" Width="400" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Long Description
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="longdescLabel" runat="server" Text='<%#Eval("LongDescription") %>' TextMode="MultiLine" Width="400" Height="600" Enabled="false" />
                    <aja:HtmlEditorExtender runat="server" Enabled="false" TargetControlID="longdescLabel" EnableSanitization="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />


    <aja:Rating runat="server" ID="ratingProduct" CurrentRating="2" MaxRating="5" CssClass="Filled" StarCssClass="ratingitem" FilledStarCssClass="Filled" EmptyStarCssClass="Empty" WaitingStarCssClass="Saved" />


    <br />

    <table>
        <tr>
            <td>
                <asp:GridView runat="server" ID="commentsdisplay" AutoGenerateColumns="false" EmptyDataText="Comment Here!">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="commentLabel" Text='<%#Eval("Comment1")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:TextBox runat="server" ID="newComment" />
            </td>
            <td>
                <asp:Button runat="server" ID="addComment" Text="Comment" CommandArgument='<%#Eval("ID") %>' OnClick="addComment_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
