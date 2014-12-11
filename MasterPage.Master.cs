using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["FirstName"] != null || Session["LastName"] != null)
            {
                UFirstname.Text = Session["FirstName"].ToString();
                ULastname.Text = Session["LastName"].ToString();
                logout.Visible = true;

            }
            else
            {
                login.Visible = true;
                logout.Visible = false;
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["FirstName"] = null;
            Session["LastName"] = null;
            Response.Redirect("default.aspx");
        }
    }
}