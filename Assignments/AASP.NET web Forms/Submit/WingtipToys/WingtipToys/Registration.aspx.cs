using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WingtipToys
{
    public partial class Registration : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;          
         Initial Catalog=WingtipToys;Integrated Security=True");


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {


                     try
                      {

            string cmdText = "INSERT into Users (UserName,FirstName,LastName,Email, Password) values (@UserName,@FirstName,@LastName,@Email, @Password)";

            SqlCommand cmd = new SqlCommand(cmdText, conn);

            cmd.Parameters.AddWithValue("@UserName", txt_name.Text);
            cmd.Parameters.AddWithValue("@FirstName", txt_first.Text);
            cmd.Parameters.AddWithValue("@LastName", txt_last.Text);
            cmd.Parameters.AddWithValue("@Password", txt_password.Text);
            cmd.Parameters.AddWithValue("@Email", txt_Email_address.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
                conn.Close();

                Session["UserName"] = txt_name.Text;

                using (WingtipToys.Logic.ShoppingCartActions usersShoppingCart = new WingtipToys.Logic.ShoppingCartActions())
                {
                    String cartId = usersShoppingCart.GetCartId();
                    usersShoppingCart.MigrateCart(cartId, txt_name.Text);
                }

                Response.Redirect("~/default.aspx");

                      }
                      catch
                       {
                         lbl_error.Text = "Chose another username this username exist";

                      }

        }
    }
}

