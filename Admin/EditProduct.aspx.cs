using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore.Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["prodId"]));

                MyStoreEntities db = new MyStoreEntities();
                //Category category = (from C in db.Categories where C.ID == id select C).FirstOrDefault();
                var product = (from prod in db.Products where prod.ID == id select prod).FirstOrDefault();

                //retrieving product info from the database 
                OldNameLabel.Text = product.Name;
                oldPrice.Text = "" + product.Price;
                oldSalePrice.Text = "" + product.SalePrice;
                Pimage.ImageUrl = "~/GetImage.ashx?prodID=" + product.ID;

                onsale.Checked = product.IsOnSale;

                oldShortDescription.Text = product.ShortDescription;
                Oldlongdescription.Text = product.LongDescription;

            }
            catch (Exception even)                  // catch any exceptions found
            {
                // Response.Redirect("EditCategory.aspx");        // if any exceptions occurs redirect the page
            }

        }

        protected void confirm_Click(object sender, EventArgs e)
        {

            //check if the user uploaded a file
            if (!file_upload.HasFile)
            {
                return;
            }

            try
            {
                // get ID of the product to edit
                int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["prodId"]));

                //create entity connection
                MyStoreEntities db = new MyStoreEntities();
                //get the product from database using the db connection made above
                Product getproduct = (from P in db.Products where P.ID == id select P).FirstOrDefault();


                // remove the old image form cloud and store the new one 

                // access your storage account
                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));

                // Create the blob client.
                CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

                // Retrieve a reference to a container. 
                CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

                // Create the container if it doesn't already exist.
                container.CreateIfNotExists();

                // Retrieve reference to a blob named from the given file
                CloudBlockBlob blockBlob1 = container.GetBlockBlobReference(getproduct.ImageName);
                blockBlob1.Delete();

                // update all the new fields in the database related to the product


                // Retrieve reference to a blob named from the given file
                CloudBlockBlob blockBlob = container.GetBlockBlobReference(Path.GetFileName(file_upload.PostedFile.FileName));

                if (blockBlob.Exists())
                    blockBlob.Delete();

                // Create the blob
                using (MemoryStream memoryStream = new MemoryStream(file_upload.FileBytes))
                {
                    blockBlob.UploadFromStream(memoryStream);           // adding file to the cloud 
                }

                // now the file is in the cloud make a note of that in our database so we can pull it later
                // adding product info and cloudimage details into database

                getproduct.ImageName = Path.GetFileName(file_upload.PostedFile.FileName);      //store the image  path of cloud

                getproduct.Name = pName.Text;
                getproduct.Price = Int32.Parse(pPrice.Text);
                getproduct.SalePrice = Int32.Parse(saleprice.Text);
                getproduct.IsOnSale = isonSale.Checked;
                getproduct.ShortDescription = shortDes.Text;
                getproduct.LongDescription = longDes.Text;
            }
            catch (Exception except)
            {

            }

        }

        protected void cancelEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/default.aspx");
        }
    }
}