<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdminMenu.Master" Theme="General" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="MyStore.Admin.EditProduct" %>
<%--EDITPRODUCT.ASPX
    Created by Lovejot Singh  2014
    This page allows user to edit product  --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centre" runat="server">
     <%@ Register TagPrefix="aja" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
    <aja:ToolkitScriptManager runat="server" />

    <table>
        <tr>
            <td>Product Name
            </td>
            <td>
                <asp:Label runat="server" ID="OldNameLabel" />
            </td>
            <td>
                <asp:TextBox runat="server" Text="" ID="pName" />
                <asp:RequiredFieldValidator runat="server" ID="rqfv" ControlToValidate="pName" ErrorMessage="*" />
            </td>
        </tr>
        <tr>
            <td>Product Price
            </td>
            <td>
                <asp:Label runat="server" ID="oldPrice" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="pPrice" />
                <asp:RequiredFieldValidator runat="server" ID="rqfv1" ControlToValidate="pPrice" ErrorMessage="*" />
            </td>
        </tr>
        <tr>
            <td>Product SalePrice
            </td>
            <td>
                <asp:Label runat="server" ID="oldSalePrice" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="saleprice" />
                <asp:RequiredFieldValidator runat="server" ID="rqfv2" ControlToValidate="saleprice" ErrorMessage="*" />
            </td>
        </tr>
        <tr>
            <td>Product SalePrice
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Product IsOnSale
            </td>
            <td>
               <asp:CheckBox runat="server" ID="onsale"  />
            </td>
            <td>
                <asp:CheckBox runat="server" ID="isonSale" />
            </td>
        </tr>
        <tr>
            <td>Product Image
            </td>
            <td>
                 <asp:Image ID="Pimage" runat="server" ImageUrl="Image" Width="300" />
            </td>
            <td><asp:FileUpload runat="server" ID="file_upload" />
                <%--if new image is uploaded the old one should be deleted from the cloud and the new one should be added to the cloud 
                also the name of the image needs to change in the database of the product --%>
            </td>
        </tr>
        <tr>
            <td>Product Short Description
            </td>

            <td>
                <asp:TextBox runat="server" Enabled="false" ID="oldShortDescription" TextMode="MultiLine"  Width="300" Height="200" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="shortDes" TextMode="MultiLine" Width="300" Height="200" />
                <asp:RequiredFieldValidator runat="server" ID="rqfv3" ControlToValidate="shortDes" ErrorMessage="*" />
                 <aja:HtmlEditorExtender runat="server" id="editor2" TargetControlID="shortDes" EnableSanitization="false" />

            </td>
        </tr>
        <tr>
            <td>Product Long Description
            </td>
            <td>
                <asp:TextBox runat="server" Enabled="false" ID="Oldlongdescription" TextMode="MultiLine"  Width="400" Height="300" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="longDes" TextMode="MultiLine" Width="400" Height="300" />
                <asp:RequiredFieldValidator runat="server" ID="rqfv4" ControlToValidate="longDes" ErrorMessage="*" />
                <aja:HtmlEditorExtender runat="server" id="editor1" TargetControlID="longdes" EnableSanitization="false" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Button runat="server" ID="confirm" Text="Save Changes" OnClick="confirm_Click" />
            </td>
            <td>
                <asp:Button runat="server" ID="cancelEdit" Text="Cancel" OnClick="cancelEdit_Click" />
                  
            </td>
        </tr>
    </table>

<%--    This area allows the administrator to edit an existing Product. This page should be able to edit and change all of the information stored in both the database and the image stored in the cloud.

This page inherits from MasterPageAdminMenu.Master--%>


</asp:Content>
