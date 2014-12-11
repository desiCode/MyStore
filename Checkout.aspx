<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MyStore.Checkout" %>
<%--CHECKOUT.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for collecting fake credit card and user information and display it as shopping was done. --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    this IS head 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centre" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="server" />
    
    <br />
    <%--customer name--%>
    <asp:Label runat="server" Text="Customer Name" />
    <asp:TextBox ID="customer_name" runat="server" Text="" />
    <ajaxToolkit:FilteredTextBoxExtender ID="cName" runat="server" TargetControlID="customer_name" FilterType="LowercaseLetters" />
    <asp:RequiredFieldValidator runat="server" ID="rqfV" ControlToValidate="customer_name" ErrorMessage="*" />
    <br />
    <%--creditcard number here--%>
    <asp:Label runat="server" Text="Credit Card Number" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox runat="server" ID="credit_number" />
    <ajaxToolkit:FilteredTextBoxExtender ID="ftbe" runat="server" TargetControlID="credit_number" FilterType="Numbers" />
    <asp:RequiredFieldValidator runat="server" ID="rqfV1" ControlToValidate="credit_number" ErrorMessage="*" />
    <asp:RegularExpressionValidator runat="server" ID="regValid" ControlToValidate="credit_number" ValidationExpression="^[0-9]{9}" ErrorMessage="Invalid Entry"/>
    <br />
    <%--date of expiry--%>
    <asp:Label runat="server" Text="ExpiryDate" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox runat="server" ID="expiryDate" />
    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="expiryDate" Format="dd/MM/yyyy" />
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="expiryDate" ErrorMessage="*" />
    <br />
    <table>
       <tr>
            <td>Buy Now</td>
            <td><asp:Button runat="server" ID="buyBtn" Text="BUY NOW" OnClick="buyBtn_Click" />
            </td>
        </tr>
        <tr>
            <td>Cancel</td>
            <td>
                <asp:Button runat="server" ID="cancelBtn" Text="Cancel"  OnClick="cancelBtn_Click"/>
            </td>
        </tr>


    </table>

</asp:Content>
