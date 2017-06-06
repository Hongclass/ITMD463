using DataBindingDemoIIT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

namespace DataBindingDemoIIT
{
    public partial class DC : System.Web.UI.Page
    {
        //NorthwindEntities nw = new NorthwindEntities();
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
        public IQueryable<DataBindingDemoIIT.Model.Customer> CustomerGrid_GetData()
        {
            return dp.GetCustomers();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<DataBindingDemoIIT.Model.Order> OrderGrid_GetData([Control("ddlCustomer")] string custID)

        {
            var query = dp.GetOrdersByCustomer(custID);
            string custd = ddlCustomer.DataValueField.ToString();
            
            return query;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        //public IQueryable GridView1_GetData([Control("ddlCustomer")] string custID)
        //{
        //    var query = from c in nw.Customers
        //                from o in nw.Orders
        //                where (c.CustomerID==custID && o.CustomerID==custID)
        //                select new { c.CompanyName, o };
        //    return  query;
        //}
        public IQueryable GridView1_GetData([Control("ddlCustomer")] string custID)
        {

            return dp.GetCustoerNameOrders(custID);
        }

    }
}