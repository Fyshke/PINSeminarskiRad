<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PINSeminarskiRad.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .login-heading {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-login {
            margin-right: 5px;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            background-color: #db1212;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #630707;
        }

        .error-message {
            display: block;
            margin-top: 10px;
            font-size: 18px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }
    </style>

    <div class="login-container">
        <h2 class="login-heading">Login</h2>
         <asp:Label ID="LblErrorPoruka" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        <div class="form-group">
            <label for="TbKorisnik" class="form-label">Korisničko ime:</label>
            <asp:TextBox ID="TbKorisnik" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TbLozinka" class="form-label">Lozinka:</label>
            <asp:TextBox ID="TbLozinka" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="button-container">
            <asp:Button ID="BtnPrijava" runat="server" Text="Prijava" OnClick="BtnPrijava_Click" CssClass="btn btn-primary btn-login" />
            <asp:Button ID="BtnRegistracija" runat="server" Text="Registracija" OnClick="BtnRegistracija_Click" CssClass="btn btn-primary btn-login" />
        </div>
       
    </div>
</asp:Content>


