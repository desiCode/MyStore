using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class MasterPageMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    MyStoreEntities db = new MyStoreEntities();
                    var categories = (from cat in db.Categories select cat).ToList();     // selecting all the categories in the db
                    displaycategory.DataSource = categories;        // assigning data source 
                    displaycategory.DataBind();                     // binding data to gridview
                    logout.Visible = false;
                    adminlink.Visible = false;
                }
                catch (Exception except)
                {

                }
            }
            if (Session["FirstName"] != null || Session["LastName"]!= null)
            {
                logout.Visible = true;
                login.Visible = false;
                adminlink.Visible = true;
            }
        }

        protected void catelink_Click(object sender, EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            Response.Redirect("categorydetails.aspx?" + "detailId=" + System.Web.HttpUtility.UrlEncode(link.CommandArgument) + "&");

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