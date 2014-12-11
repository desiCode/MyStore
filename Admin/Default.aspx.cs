using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["FirstName"] == null)
                //{
                //    Response.Redirect("~/default.aspx");
                //}
                try
                {
                    MyStoreEntities db = new MyStoreEntities();         // creating connection
                    var allEntries = (from f in db.Categories select f).ToList();           // collecting data from the database 

                    catView.DataSource = allEntries;            // giving the data source to the gridview
                    catView.DataBind();                         // binding gridview with data

                    var allproducts = (from p in db.Products select p).ToList();        // retreive all the products
                    productView.DataSource = allproducts;
                    productView.DataBind();

                } // end of try
                catch (Exception except)
                {
                    Response.Write(except.ToString());
                }   // end of catch
            } // end of if 
        }

        protected void del_category(object sender, EventArgs e)
        {
            try
            {
                Button cat = (Button)sender;                    // creating a button 
                int id = Int32.Parse(cat.CommandArgument);       // converting the ID into int

                MyStoreEntities db = new MyStoreEntities();         // creating connection

                var getcat = (from C in db.Categories where C.ID == id select C).FirstOrDefault();          // get the category to delete from the database

                var getproducts = (from P in db.Products where P.CategoryId == id select P).ToList();

                //go through each product and get all the comments related to each product
                foreach (var prod in getproducts)
                {
                    var getcomment = (from Com in db.Comments where Com.ProductId == prod.ID select Com).ToList();
                    //remove each comment as we get
                    if (getcomment != null)
                    {
                      db.Comments.RemoveRange(getcomment);
                      getcomment = null;            //set it to null so next time new comments are deleted
                    }
                }
                db.Products.RemoveRange(getproducts);       // remove all the products related to the category 
                db.Categories.Remove(getcat);              // remove the category
                db.SaveChanges();                       // savechanges

               
                var allEntries = (from f in db.Categories select f).ToList();           // collecting data from the database 

                catView.DataSource = allEntries;            // giving the data source to the gridview
                catView.DataBind();                         // binding gridview with data
            }
            catch (Exception ex)                //catch exception if any and do nothing :)
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void edit_category(object sender, EventArgs e)
        {
            Button cat = (Button)sender;                    // creating a button 

            // create rquest string and send the ID of the category to edit to edit category page
            Response.Redirect("editcategory.aspx?" + "catId=" + System.Web.HttpUtility.UrlEncode(cat.CommandArgument) + "&");


        }

        protected void del_product(object sender, EventArgs e)
        {
            try
            {
                Button cat = (Button)sender;                    // creating a button 
                int id = Int32.Parse(cat.CommandArgument);       // converting the ID into int

                MyStoreEntities db = new MyStoreEntities();         // creating connection

                // get the category to delete from the database
                var getproduct = (from P in db.Products where P.ID == id select P).FirstOrDefault();

                //get all the comments related to the products
                var getcomment = (from C in db.Comments where C.ProductId == getproduct.ID select C).ToList();

                // access your storage account
                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));

                // Create the blob client.
                CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

                // Retrieve a reference to a container. 
                CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

                // Create the container if it doesn't already exist.
                container.CreateIfNotExists();

                // Retrieve reference to a blob named from the given file
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(getproduct.ImageName);
                blockBlob.Delete();

                // remove the file from the database 

                //remove all the comments from database
                db.Comments.RemoveRange(getcomment);
                db.Products.Remove(getproduct);               // remove the category
                db.SaveChanges();                       // savechanges

                var allproducts = (from p in db.Products select p).ToList();        // retreive all the products
                productView.DataSource = allproducts;
                productView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Redirect("editproduct.aspx?" + "Something Went Wrong Please Try Again");
            }

        }

        protected void edit_product(object sender, EventArgs e)
        {

            Button cat = (Button)sender;                    // creating a button 

            //Create reuqest string with productView id and send iterator the prudct edit Page 
            Response.Redirect("editproduct.aspx?" + "prodId=" + System.Web.HttpUtility.UrlEncode(cat.CommandArgument));




        }
    }
}