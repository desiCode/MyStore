<%@ Page Title="" Language="C#" Theme="General" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyStore.Login" %>
<%--LOGIN.ASPX
    Created by Lovejot Singh  2014
    This page is responsible for sigin the user in the admin view where he can controll the products --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="left" runat="server">

    <table style="width: 100%">
        <tr>
            <td>Username</td>
            <td>
                <asp:TextBox ID="username" Text="" runat="server" Width="200px" />
                
            </td>
            <td>
                <asp:RegularExpressionValidator ID="validusername" runat="server" ControlToValidate="username" ValidationExpression="^[a-z]{3,4}" ErrorMessage="Invalid Username" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="* Fill In" />
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="password" Text="" runat="server" TextMode="Password" Width="200px" />
                <asp:RequiredFieldValidator ID="require_password" runat="server" ControlToValidate="password" ErrorMessage="* Fill In" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>

                <asp:Button ID="submit" Text="Login" OnClick="submit_Click" runat="server" />

            </td>

        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="right" runat="server">
  

</asp:Content>

