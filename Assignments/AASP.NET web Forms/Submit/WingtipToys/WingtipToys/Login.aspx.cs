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

namespace WingtipToys
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;          
         Initial Catalog=WingtipToys;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(@"select 1 from [Users] where UserName='" + txtusername.Text.Trim() + "' and Password='" + txtpassword.Text.Trim() + "'", cn);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Session["UserName"] = txtusername.Text.Trim();
                WingtipToys.Logic.ShoppingCartActions usersShoppingCart = new WingtipToys.Logic.ShoppingCartActions();
                String cartId = usersShoppingCart.GetCartId();
                usersShoppingCart.MigrateCart(cartId, txtusername.Text);
                Response.Redirect("~/default.aspx");
                //     Response.Redirect("~/OrderSummary.aspx?UserName=" + txtusername.Text);
                Session["UserName"] = txtusername.Text;
            }
            else
            {
                spnmsg.Visible = true;
                Response.Redirect("~/Registration.aspx");
            }
            cn.Close();
        }

    }
}