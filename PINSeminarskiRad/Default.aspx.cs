using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PINSeminarskiRad
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegistracijaLink.NavigateUrl = "~/Registracija.aspx";
            LoginLink.NavigateUrl = "~/Login.aspx";
            MinigameLink.Attributes["onclick"] = "return confirm('Molimo prvo se prijavite.');";
            MinigameLink.NavigateUrl = "~/Login.aspx";
        }

        
    }
}