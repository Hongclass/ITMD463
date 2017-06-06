using DataBindingDemoIIT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBindingDemoIIT
{
    public partial class SR : System.Web.UI.Page
    {
        DataProvider dp = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ordid = Convert.ToInt32(DropDownList1.SelectedValue);

            //ListView1.DataSource = dp.GetOrderDetailsByOrder(ordid).ToList();
            //ListView1.DataBind();
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selorder =Convert.ToInt32(ListView1.SelectedDataKey.Value);
            int abc =Convert.ToInt32(ListView1.SelectedDataKey.Values[1]);
            DetailsView1.DataSource = GetOrderDetailItem(selorder,abc).ToList();
            DetailsView1.DataBind();
        }

        public IQueryable<DataBindingDemoIIT.Model.Order_Detail> DetailsView1_GetItem(int orderID)
        {
            return dp.GetOrderDetailsByOrder(orderID);

        }
        public IQueryable<Order_Detail> GetOrderDetailItem(int ordid, int prodid)
        {
            return dp.GetODProd(ordid,prodid);
        }
    }
}