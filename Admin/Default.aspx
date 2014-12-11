<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyStore.Admin.Default" %>
  <%--DEFAULT.ASPX
    Created by Lovejot Singh  2014
    This is admin default page which allows user to add edit,delete category or products on the page --%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="left" runat="server">
    <asp:GridView runat="server" ID="catView" AutoGenerateColumns="false" EmptyDataText="No Categories">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Button
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Width="100px" ID="delBtn" CssClass="btn btn-danger" CommandArgument='<%#Eval("ID") %>' Text="Delete" OnClick="del_category" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Edit Button
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Width="100px" ID="editBtn" CssClass="btn btn-warning" CommandArgument='<%#Eval("ID") %>' Text="Edit" OnClick="edit_category" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Categories
                </HeaderTemplate>
                <ItemTemplate>
                    <div  class="label label-info well-sm"  >
                        <%#Eval("CategoryName") %>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />
    <%--  On this page display all of the Categories using a GridView or Repeater. This GridView or Repeater must have a 
    ‘Delete’ and ‘Edit’ button. If the user clicks the ‘Delete’ button the category, and all associated products 
    are deleted from the database. If the user clicks the ‘Edit’ button the user is redirected to 
    ~/Admin/EditCategory.aspx and the category id passed to the page using the request string.--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">

    <asp:GridView runat="server" ID="productView" AutoGenerateColumns="false" EmptyDataText="No Products">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate><div  class="label label-default well-sm"  >
                    Delete Button</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button runat="server" Width="100px" CssClass="btn btn-danger" ID="delProductBtn" CommandArgument='<%#Eval("ID") %>' Text="Delete" OnClick="del_product" />
                </ItemTemplate>
            </asp:TemplateField>
          
            <asp:TemplateField>
                <HeaderTemplate>
                    Product Name
                </HeaderTemplate>
                <ItemTemplate> <div class="label label-info">
                    <%#Eval("Name")%></div>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Product Price
                </HeaderTemplate>
                <ItemTemplate> <div class="label label-info">
                    <%#Eval("Price")%></div>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Product Description
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("ShortDescription") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <br />
    <%-- This area is the home page of the administration area. Only administrators are allowed to come to this page.

This page inherits from MasterPageAdminMenu.Master


On this page you will also display a list of all of the Products in your store using a GridView or Repeater. 
This GridView or Repeater must have a ‘Delete’ and ‘Edit’ button and display the products Name, 
Short Description and Price.If the user clicks the ‘Delete’ button the product, is deleted from the database.
     If the user clicks the ‘Edit’ button the user is redirected to ~/Admin/EditProduct.aspx and the product id 
    passed to the page using the request string.--%>
</asp:Content>
