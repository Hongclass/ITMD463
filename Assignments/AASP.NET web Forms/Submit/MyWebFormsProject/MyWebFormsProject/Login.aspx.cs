using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace MyWebFormsProject
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            var _db = new MyWebFormsProject.Models.ProductContext();

            var user = _db.Users.Where(u => u.UserName == txtusername.Text.Trim() && u.Password == txtpassword.Text.Trim());

            if (user.Any())
            {
                Session["UserName"] = txtusername.Text.Trim();

                MyWebFormsProject.Logic.ShoppingCartActions usersShoppingCart = new MyWebFormsProject.Logic.ShoppingCartActions();
                String cartId = usersShoppingCart.GetCartId();
                usersShoppingCart.MigrateCart(cartId, txtusername.Text);

                if (Session["payment_amt"] != null)
                {
                    Response.Redirect("~/OrderSummary.aspx");
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
                    
            }
            else
            {
               spnmsg.Visible = true;
            }
        }

        protected void btn_registration_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }
    }
}
