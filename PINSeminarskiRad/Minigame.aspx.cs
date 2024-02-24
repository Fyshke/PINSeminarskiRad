using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Timers;
using System.Web.UI;
using System.Data;
using System.Configuration;

namespace PINSeminarskiRad
{
    using System.Security.Cryptography;

    public partial class Minigame : System.Web.UI.Page
    {
        private int trazenibroj;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random random = new Random();
                trazenibroj = random.Next(1, 51); 
                Session["trazenibroj"] = trazenibroj;
                UcitajHighscoreTablicu();
            }
            else
            {
                // pamti iako osvježimo stranicu
                trazenibroj = (int)Session["trazenibroj"];
            }
        }

        protected void btnUnos_Click(object sender, EventArgs e)
        {
            int pokusaj;

            if (int.TryParse(tbPogodi.Text, out pokusaj))
            {
                // ovo povlači broj pokušaja iz ViewState
                int pokusaji = (int)(ViewState["pokusaji"] ?? 0); //?? 0 osigurava da var 'pokusaji' uvijek ima vrijednost
                pokusaji++; 

                if (pokusaj == trazenibroj)
                {
                    lblPoruka.Text = $"Bravo! Pogodili ste broj u {pokusaji} pokušaja.";
                    SpremiHighscore(pokusaji);
                    UcitajHighscoreTablicu();
                    ViewState["pokusaji"] = 0; 
                }
                else if (pokusaj < 1 || pokusaj > 50)
                {
                    lblPoruka.Text = "Uneseni broj je van granica.";
                }
                else if (pokusaj < trazenibroj)
                {
                    lblPoruka.Text = "Broj je veći.";
                }
                else
                {
                    lblPoruka.Text = "Broj je manji.";
                }

                // sprema broj pokušaja u ViewState
                ViewState["pokusaji"] = pokusaji;
            }
            else
            {
                lblPoruka.Text = "Unesite važeći broj.";
            }
        }

        protected void btnRestart_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            trazenibroj = random.Next(1, 51);
            Session["trazenibroj"] = trazenibroj;
            lblPoruka.Text = ""; 
            ViewState["pokusaji"] = 0; 

            UcitajHighscoreTablicu();
        }

        protected void btnNazad_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx"); 
        }


        private void SpremiHighscore(int pokusaji)
        {
            string playerName = Session["PrijavljenUserName"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["PINConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            INSERT INTO HighScores (PlayerName, Pokusaji, Mjesto)
            SELECT @PlayerName, @pokusaji, COUNT(*) + 1
            FROM HighScores
            WHERE Pokusaji < @pokusaji;
        ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PlayerName", playerName);
                cmd.Parameters.AddWithValue("@pokusaji", pokusaji);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void UcitajHighscoreTablicu()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PINConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT TOP 10
                ROW_NUMBER() OVER (ORDER BY Pokusaji) AS Mjesto,
                PlayerName,
                Pokusaji 
            FROM 
                HighScores 
            ORDER BY 
                Pokusaji";

                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridViewScores.DataSource = dt;
                GridViewScores.DataBind();
            }
        }

    }
}











