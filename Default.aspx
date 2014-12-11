<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyStore.Default" %>
<%--DEFAULT.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for displaying the products that are on Sale.c User can login the site to shop around--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <table>
        <tr>
            <asp:GridView ID="saleproducts" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="saleproducts_PageIndexChanged" EmptyDataText="No products on Sale">
                <Columns>

                    <asp:TemplateField>
                        <HeaderTemplate>
                            Product
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td> Product Name:
                           <asp:Label CssClass="label label-default" runat="server" Text='<%#Eval("Name") %>' />
                                        <br />
                                        Product Price:
                           <asp:Label CssClass="label label-default" runat="server" Text='<%#Eval("Price") %>' />
                                        <br />
                                        Product SalePrice:
                           <asp:Label CssClass="label label-default" runat="server" Text='<%#Eval("SalePrice") %>' />
                                        <br />
                                        <a href="#" class="thumbnail" style="width:400px; ">
                                        <asp:Image runat="server" ID="image" ImageUrl='<%#"~/GetImage.ashx?prodID="+Eval("ID") %>' Width="400" /></a>
                                        <br />
                                        ShortDescription:
                           <asp:TextBox runat="server" Height="200" Width="300" Enabled="false" ID="shortdesc" Text='<%#Eval("Shortdescription") %>' TextMode="MultiLine" />
                                        <br />
                                    </td>
                                </tr>
                            </table>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </tr>
    </table>


</asp:Content>
