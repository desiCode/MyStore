using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore.Admin
{
    public partial class BadWords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MyStoreEntities db = new MyStoreEntities();
                var words = (from f in db.BadWords select f).ToList();
                badGrid.DataSource = words;
                badGrid.DataBind();
            }
            catch (Exception except)
            {
               
            }

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            MyStoreEntities db = new MyStoreEntities();

            BadWord newWord = new BadWord();
            newWord.Word = addBword.Text;
            db.BadWords.Add(newWord);

            db.SaveChanges();

           
            Response.Redirect("BadWords.aspx");
        }
    }
}