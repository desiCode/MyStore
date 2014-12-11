using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["detailId"]));

                MyStoreEntities db = new MyStoreEntities();

                var getprod = (from prod in db.Products where prod.CategoryId == id select prod).ToList();

                categoryView.DataSource = getprod;
                categoryView.DataBind();
            }
           
        }

        protected void Namelink_Click(object sender, EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            Response.Redirect("productdetails.aspx?" + "prodId=" + System.Web.HttpUtility.UrlEncode(link.CommandArgument) + "&");

        }
    }
}