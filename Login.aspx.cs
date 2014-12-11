using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //AlgonquinLogin.AuthenticateServiceSoapClient soap = new AlgonquinLogin.AuthenticateServiceSoapClient(); //create a soap client to connect to college services

            //var authenticate = soap.AuthenticateUser(username.Text, password.Text); // get user authentication
            var authenticate = false;
            if (username.Text.Equals("Test") && password.Text.Equals("Test"))
            {
                 authenticate = true;
            }
           

            if(authenticate != null){ // check to see if the user exists


                //create session variable
                Session["FirstName"] = "User";
                Session["LastName"] = "Logged In";
               

                Session["Cart"] = new List<int>();          // create a list of int to catch product id's
                Response.Redirect("~/admin/default.aspx");

                //if (authenticate.IsStudent == true)
                //{
                //    Response.Redirect("~/admin/default.aspx");
                //}
                //else if(authenticate.IsStaff == true)
                //{
                //    Response.Redirect("~/default.aspx"); // redirect user to default page 
                //}
                
                
                
            }
            else
            {
               
                password.Text = "";
            }

        }


    }
}