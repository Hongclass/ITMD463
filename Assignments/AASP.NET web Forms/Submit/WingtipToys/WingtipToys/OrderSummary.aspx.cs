using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WingtipToys.Models;

namespace WingtipToys
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;          
                 Initial Catalog=WingtipToys;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["payment_amt"] != null)
            {
                string amt = Session["payment_amt"].ToString();
                Label2.Text = amt;
            }

            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                throw new Exception("ERROR: UserName could not be null");
            }

            if (Session["CartId"] == null)
            {
                throw new Exception("ERROR: CartId could not be null");
            }

            var myOrder = new Order();

            myOrder.Username = Session["UserName"].ToString();
            myOrder.Address = txt_address.Text;
            myOrder.Phone = txt_mobile_no.Text;
            myOrder.Payment = ddl_payment_option.SelectedValue;
            myOrder.OrderDate = System.DateTime.Now;

            if (Session["payment_amt"] != null)
            {
                decimal paymentTotal = Convert.ToDecimal(Session["payment_amt"].ToString());
                myOrder.Total = paymentTotal;
            }

            // Get DB context.
            ProductContext _db = new ProductContext();

            _db.Orders.Add(myOrder);

            var createdOrder = _db.SaveChanges();

            // Get the shopping cart items and process them.
            using (WingtipToys.Logic.ShoppingCartActions usersShoppingCart = new WingtipToys.Logic.ShoppingCartActions())
            {
                List<CartItem> myOrderList = usersShoppingCart.GetCartItems();

                // Add OrderDetail information to the DB for each product purchased.
                for (int i = 0; i < myOrderList.Count; i++)
                {
                    string name = Session["UserName"].ToString();
                    // Create a new OrderDetail object.
                    var myOrderDetail = new OrderDetail();

                    myOrderDetail.OrderId = myOrder.OrderId;
                    myOrderDetail.Username = name;
                    myOrderDetail.ProductId = myOrderList[i].ProductId;
                    myOrderDetail.Quantity = myOrderList[i].Quantity;
                    myOrderDetail.UnitPrice = myOrderList[i].Product.UnitPrice;

                    _db.OrderDetails.Add(myOrderDetail);
                }
                _db.SaveChanges();
            }
            // Set OrderId.
            Session["currentOrderId"] = myOrder.OrderId;

            Response.Redirect("~/Thankyou.aspx");

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}