using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FirstName"] == null)
            {
                Response.Redirect("~/default.aspx");
            }
            if (!IsPostBack)
            {
                //get the list of product id's that have been added to the cart
                var products = (List<int>)Session["Cart"];
              
               
                try
                {
                    MyStoreEntities db = new MyStoreEntities();
                    //create list to display all products added to cart
                    List<Product> display = new List<Product>();
                    //obejct to hold the product 
                    Product list = new Product();
                    decimal total_price = 0;
                    //run through the list of id's and get the products
                    foreach (var item in products)
                    {

                        list = (from cat in db.Products where cat.ID == item select cat).First();
                        if (list != null)
                        {
                            display.Add(list);
                            total_price += list.Price;
                        }
                        list = null;
                    }
                    totalPrice.Text = "" + total_price;
                    incart.DataSource = display;
                    incart.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }


        protected void BuyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/checkout.aspx");
        }

        protected void continueshopp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void removeProd_Click(object sender, EventArgs e)
        {
            Button delbtn = (Button)sender;

            int productid = Int32.Parse(delbtn.CommandArgument);

            //get the list of product id's that have been added to the cart
            var products = (List<int>)Session["Cart"];

            products.Remove(productid);

            try
            {
                MyStoreEntities db = new MyStoreEntities();
                //create list to display all products added to cart
                List<Product> display = new List<Product>();
                //obejct to hold the product 
                Product list = new Product();
                decimal total_price = 0;

                //run through the list of id's and get the products
                foreach (var item in products)
                {

                    list = (from cat in db.Products where cat.ID == item select cat).First();
                    if (list != null)
                    {
                        display.Add(list);
                        total_price += list.Price;
                    }
                    list = null;
                }
                totalPrice.Text = "" + total_price;
                incart.DataSource = display;
                incart.DataBind();
            }
            catch (Exception ex)
            {

            }

        }
    }
}