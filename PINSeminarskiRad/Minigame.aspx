<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Minigame.aspx.cs" Inherits="PINSeminarskiRad.Minigame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pogađanje broja</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        

        .input-group {
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between; 
        align-items: center; 
    }

        .form-control {
            width: 70%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }

        .btn {
            padding: 10px 20px;
            margin-left: 5px;
            background-color: #db1212;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #630707;
        }

        .result {
            font-weight: bold;
            margin-top: 10px;
            text-align: left;
            font-size: 18px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        h3 {
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }

        .grid-container {
            margin-top: 20px;
            text-align: center; 
        }

        .grid-container table tr:nth-child(1) {
            background-color: #db1212;
        }

        .grid-container table tr:nth-child(2) {
            background-color: yellow;
        }

        .grid-container table tr:nth-child(3) {
            background-color: lightgray;
        }

        .grid-container table tr:nth-child(4) {
            background-color: brown;
        }

        .grid-container table tr:nth-child(n+5):nth-child(-n+11) {
            background-color: #dde0ab;
        }
        
        @media (max-width: 768px) {
            .container {
                width: 80%;
            }

            .form-control {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Pogađanje broja</h2>
            <div class="input-group">
                <asp:TextBox ID="tbPogodi" runat="server" CssClass="form-control" placeholder="Unesite broj između 1 i 50" type="number"></asp:TextBox>
                <asp:Button ID="btnUnos" runat="server" Text="Unos" CssClass="btn" OnClick="btnUnos_Click" />
                <asp:Button ID="btnRestart" runat="server" Text="Restart" OnClick="btnRestart_Click" CssClass="btn" />
                <asp:Button ID="btnNazad" runat="server" Text="Nazad" CssClass="btn" OnClick="btnNazad_Click" />
            </div>
            <asp:Label ID="lblPoruka" runat="server" CssClass="result" Text=""></asp:Label>
            <hr />
            <h3>Highscore tablica</h3>
            <div class="grid-container">
                <asp:GridView ID="GridViewScores" runat="server" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Mjesto" HeaderText="Rang" />
                        <asp:BoundField DataField="PlayerName" HeaderText="Korisničko ime" />
                        <asp:BoundField DataField="Pokusaji" HeaderText="Broj pokušaja" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>



