using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

namespace MyStore.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MyStoreEntities db = new MyStoreEntities();  // creating connection with the database
                var alldata = (from list in db.Categories select list).ToList();      //extracting data from database
                catview.DataSource = alldata;           // databind with gridview
                catview.DataBind();
            }
            catch (Exception even)                  // catch any exceptions found
            {
                Response.Redirect("AddCategory.aspx");        // if any exceptions occurs redirect the page
            }
        }

        /*addcat_click function
         *  this function is called when the submit button is pressed 
         * In this function a connection is created with the database
         * object of table type are created and new data is inserted in the object
         * and added to the database
         */ 
        protected void addcat_Click(object sender, EventArgs e)
        {

            try
            {
                MyStoreEntities db = new MyStoreEntities();         // connection to the database
                Category input = new Category();                    // category table object
                input.CategoryName = addCategory.Text;              // adding data to the object
                db.Categories.Add(input);                           // add obejct to the database
                db.SaveChanges();                                   // save changes
                addCategory.Text = "";
            }
            catch (Exception except)            // catch if any exception is generated
            {
                ;
            }
            Response.Redirect("AddCategory.aspx");
        }
    }
}