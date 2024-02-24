<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PINSeminarskiRad._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .links-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .link {
            margin: 0 10px;
            text-decoration: none;
            color: #333;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .link:hover {
            color: #db1212;
        }
    </style>

    
    <div class="links-container">
        <asp:HyperLink ID="RegistracijaLink" runat="server" CssClass="link">Registracija</asp:HyperLink>
        <asp:HyperLink ID="LoginLink" runat="server" CssClass="link">Login</asp:HyperLink>
        <asp:HyperLink ID="MinigameLink" runat="server" CssClass="link">Minigame</asp:HyperLink>

    </div>
</asp:Content>



