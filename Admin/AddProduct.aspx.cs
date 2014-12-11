using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.IO;

namespace MyStore.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    MyStoreEntities data = new MyStoreEntities();
                    var stuff = (from f in data.Categories select f).ToList();
                    catList.DataSource = stuff;
                    catList.DataValueField = "ID";
                    catList.DataTextField = "CategoryName";
                    catList.SelectedIndex = 0;
                    catList.DataBind();
                }
                catch (Exception except)
                {

                }
            }
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {


            var newProduct = new MyStore.Product();  // Product table entity/connection
            

            if (file_upload.HasFile == false)
            {
                errormessage.Text = "Didn't Upload a Picture";
                errormessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
              
            // Retrieve storage account from connection string.
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the blob client.
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            // Retrieve a reference to a container. 
            CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

            // Create the container if it doesn't already exist.
            container.CreateIfNotExists();

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
           
            newProduct.ImageName = Path.GetFileName(file_upload.PostedFile.FileName);      //store the image  path of cloud

            newProduct.CategoryId = Int32.Parse(catList.SelectedValue);                //Product category id
            newProduct.IsOnSale = isOnSale.Checked;                                        //Product  category on sale boolean
            newProduct.Name = ProductName.Text;                                            //Product Name
            newProduct.SalePrice = Decimal.Parse(salePrice.Text);                          //Product sale Price
            newProduct.Price = Decimal.Parse(pPrice.Text);                                 //Product Price original
            newProduct.ShortDescription = shortdes.Text;                                   //Product  short description
            newProduct.LongDescription = longdes.Text;                                     //Product  long description
            

            // adding data into database 

            var db = new MyStoreEntities();
            db.Products.Add(newProduct);                                // add product to database
            db.SaveChanges();                                           // save changes 

            errormessage.Text = "Product added to Database!";          // just a message
            errormessage.ForeColor = System.Drawing.Color.LawnGreen;


            //clearing out the old values 
            isOnSale.Checked = false;
            ProductName.Text = "";
            salePrice.Text = "";
            pPrice.Text = "";
            shortdes.Text = "";
            longdes.Text = "";



        }

    }

}