using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore.Admin
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //fNamelabel.Text = System.Web.HttpUtility.UrlDecode(Request["firstName"]);
                int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["catId"]));

                MyStoreEntities db = new MyStoreEntities();
                Category category = (from C in db.Categories where C.ID == id select C).FirstOrDefault();
                oldlabel.Text = category.CategoryName;
                submit.CommandArgument = "" + category.ID;

              
            }
            catch (Exception even)                  // catch any exceptions found
            {
                Response.Redirect("~/admin/default.aspx");        // if any exceptions occurs redirect the page
            }



        }

        protected void edit_cat(object sender, EventArgs e)
        {
            try
            {
                Button submit = (Button)sender;
                MyStoreEntities db = new MyStoreEntities();

                int id = Int32.Parse(submit.CommandArgument);
                Category entry = new Category();

                entry = (from f in db.Categories where f.ID == id select f).FirstOrDefault();

                entry.CategoryName = newLabel.Text;

                db.SaveChanges();

                Response.Redirect("~/admin/default.aspx");
            }
            catch (Exception ex)
            {

            }
        }



    }
}