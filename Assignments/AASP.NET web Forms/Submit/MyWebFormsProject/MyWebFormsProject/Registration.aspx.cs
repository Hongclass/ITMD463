using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace MyWebFormsProject
{
    public partial class Registration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                var _db = new MyWebFormsProject.Models.ProductContext();

                var user = new MyWebFormsProject.Models.User();
                user.UserName = txt_name.Text;
                user.FirstName = txt_first.Text;
                user.LastName = txt_last.Text;
                user.Password = txt_password.Text;
                user.Email = txt_Email_address.Text;

                _db.Users.Add(user);
                _db.SaveChanges();

                Session["UserName"] = txt_name.Text;

                using (MyWebFormsProject.Logic.ShoppingCartActions usersShoppingCart = new MyWebFormsProject.Logic.ShoppingCartActions())
                {
                    String cartId = usersShoppingCart.GetCartId();
                    usersShoppingCart.MigrateCart(cartId, txt_name.Text);
                }

                if (Session["payment_amt"] != null)
                {
                    Response.Redirect("~/OrderSummary.aspx");
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

            }
            catch (Exception ex)
            {
                lbl_error.Text = ex.Message;
            }

        }
    }
}


