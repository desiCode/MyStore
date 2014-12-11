using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["Cart"] == null)
            //{
            //    addtocart.Visible = false;
            //}

            if(!IsPostBack){
                try
                {
                    // decode the product id 
                    int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["prodId"]));
                   
                    // create connection
                    MyStoreEntities db = new MyStoreEntities();

                    //connect gridview with datbase
                    productDetails.DataSource = (from prod in db.Products where prod.ID == id select prod).ToList();
                    productDetails.DataBind();      // bind the datatogether


                    //connect the commment gridview 
                    commentsdisplay.DataSource = (from com in db.Comments where com.ProductId == id select com).ToList();
                    commentsdisplay.DataBind(); //bind the database

                }
                catch (Exception ex)
                {

                }
            }

        }

       
        protected void addComment_Click(object sender, EventArgs e)
        {

            try
            {
                //get the product id 
                int id = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["prodId"]));

                //create Commment object
                Comment entry = new Comment();
                // create connection to database 
                MyStoreEntities db = new MyStoreEntities();
                ////////////////////////////////////////////////

                var productComments = (from pc in db.Comments where pc.ProductId == id select pc);
                var badWords = (from bw in db.BadWords select bw.Word);
                
                
                
                    foreach (var badWord in badWords)
                    {
                        if (newComment.Text.ToString().ToLower().Contains(badWord.ToString().ToLower()))
                        {
                            newComment.Text = newComment.ToString().ToLower().Replace(badWord.ToString().ToLower(), "****");
                        }
                    }
                



                //store the comment
                entry.Comment1 = newComment.Text;
                //store the product ID
                entry.ProductId = id;
                //store the comment in the database
                db.Comments.Add(entry);
                db.SaveChanges();

                //connect the commment gridview 
                commentsdisplay.DataSource = (from com in db.Comments where com.ProductId == id select com).ToList();
                commentsdisplay.DataBind(); //bind the database
                //save datbase changes
                newComment.Text = "";
            }
            catch (Exception ex)
            {

            }
        } 

        protected void addtocart_Click(object sender, EventArgs e)
        {
            

            int prodid = Int32.Parse(System.Web.HttpUtility.UrlDecode(Request["prodId"]));

            if (Session["Cart"] != null)
            {
                //if the session doesn't exist creat one with the new list
                var products = (List<int>)Session["Cart"];

                //before adding product id to the list check if the product of same category exists already
                bool check=true;
                MyStoreEntities db = new MyStoreEntities();

                // preventing two products of same category to be added in the Cart
                var check_catgeory = (from C in db.Products where C.ID == prodid select C.CategoryId).First();
                foreach (int i in products)
                {
                    var compare = (from C in db.Products where C.ID == i select C.CategoryId).FirstOrDefault();
                    if (compare == check_catgeory)
                    {
                        check = false;
                    }
                }

                if (check == true)          // if no previous product of same category is added only then add it to 
                {
                    products.Add(prodid);       //add product id to the List
                    Session["Cart"] = products;     //store the list back to Session
                }
                
            }
           
        }
    }
}