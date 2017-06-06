using DataBindingDemoIIT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBindingDemoIIT
{
    public partial class OrderList : System.Web.UI.Page
    {
        DataProvider dp = new DataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<DataBindingDemoIIT.Model.Order> orderList_GetData([QueryString("id")] string customerID)
        {
            return dp.GetOrdersByCustomer(customerID);
        }

        protected void orderList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selorder = (int) orderList.SelectedDataKey.Value;
            //DetailsView1.DataSource = DetailsView1_GetItem(selorder).ToList();
            //DetailsView1.DataBind();
            Repeater1.DataSource = DetailsView1_GetItem(selorder).ToList();
            Repeater1.DataBind();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IQueryable<DataBindingDemoIIT.Model.Order_Detail> DetailsView1_GetItem(int orderID)
        {
            return dp.GetOrderDetailsByOrder(orderID);
            
        }


        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
    }
}