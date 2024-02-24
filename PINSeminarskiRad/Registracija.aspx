<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registracija.aspx.cs" Inherits="PINSeminarskiRad.Registracija" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .registration-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .registration-heading {
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

        .btn-register {
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

        .btn-register:hover {
            background-color: #630707;
        }

        .error-message {
            display: block;
            margin-top: 10px;
            font-size: 18px;
        }
    </style>

    <div class="registration-container">
        <h2 class="registration-heading">Registriraj se</h2>
        <asp:Label ID="lblErrorPoruka" runat="server" ForeColor="Red" CssClass="error-message"></asp:Label>
        <div class="form-group">
            <label for="TbKorisnik" class="form-label">Korisničko ime:</label>
            <asp:TextBox ID="TbKorisnik" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TbIme" class="form-label">Puno ime:</label>
            <asp:TextBox ID="TbIme" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TbLozinka" class="form-label">Lozinka:</label>
            <asp:TextBox ID="TbLozinka" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="TbPLozinka" class="form-label">Unesite lozinku ponovno:</label>
            <asp:TextBox ID="TbPLozinka" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="BtnRegister" runat="server" OnClick="BtnRegister_Click" Text="Registriraj" CssClass="btn btn-primary btn-register" />
    </div>
</asp:Content>
