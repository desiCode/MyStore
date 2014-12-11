using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    MyStoreEntities db = new MyStoreEntities();

                    var productOnSale = (from prod in db.Products where prod.IsOnSale == true select prod).ToList();

                    saleproducts.AllowPaging = true;
                    saleproducts.PageSize = 5;
                   
                    saleproducts.DataSource = productOnSale;
                    saleproducts.DataBind();
                }
                catch (Exception ex)
                {

                }

            }



        }

        protected void saleproducts_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            MyStoreEntities db = new MyStoreEntities();

            saleproducts.PageIndex = e.NewPageIndex;
            saleproducts.DataSource = (from p in db.Products where p.IsOnSale == true select p).ToList();
            saleproducts.DataBind();

        }
    }
}