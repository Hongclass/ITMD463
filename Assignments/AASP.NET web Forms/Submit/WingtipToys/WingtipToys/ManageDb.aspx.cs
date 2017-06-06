using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys
{
    public partial class ManageDb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_products_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/ProductsDB.aspx");
        }

        protected void btn_orders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/OrdersDB.aspx");
        }

        protected void btn_users_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/UsersDB.aspx");
        }

    }
}