﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PINSeminarskiRad
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnPrijava_Click(object sender, EventArgs e)
        {
            string korisnik = TbKorisnik.Text;
            string lozinka = TbLozinka.Text;

            //provjera postoji li vec korisnik u bazi
            if (ValidacijaKorisnika(korisnik, lozinka))
            {
                Session["PrijavljenUserName"] = korisnik;
                Response.Redirect("~/Minigame.aspx");
            }
            else
            {
                LblErrorPoruka.Text = "Došlo je do greške, pokušajte ponovno.";
            }
        }
        protected void BtnRegistracija_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registracija.aspx");
        }


        private static bool ValidacijaKorisnika(string korisnik, string lozinka)
        {
            using (SqlConnection _connection = new
                SqlConnection(ConfigurationManager.ConnectionStrings["PINConnectionString"].ToString()))
            {
                _connection.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE UserName = @UserName AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, _connection))
                {
                    cmd.Parameters.AddWithValue("@UserName", korisnik);
                    cmd.Parameters.AddWithValue("@Password", lozinka);

                    //vraća broj podudarajućih query redova
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }
    }
}