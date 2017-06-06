using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataBindingDemoIIT.Model
{
    public class DataProvider
    {
        NorthwindEntities ctx = new NorthwindEntities();
        public IQueryable<Customer> GetCustomers() 
        {
            return ctx.Customers;
        }
        public IQueryable<Order> GetOrdersByCustomer(string customerID)
        {
            return ctx.Orders.Where(c => c.CustomerID == customerID);
        }
        public IQueryable<Order_Detail> GetOrderDetailsByOrder(int orderID)
        {
            return ctx.Order_Details.Where(od => od.OrderID == orderID);
        }
        public IQueryable<Order_Detail> GetODProd(int ordid, int prodid)
        {
            return ctx.Order_Details.Where(od => od.OrderID == ordid && od.ProductID == prodid);
        }
        public Customer GetCustomerByID(string customerID)
        {
            return ctx.Customers.Where(cs => cs.CustomerID == customerID).FirstOrDefault();
        }
        public void UpdateCustomer(Customer cust)
        {
            ctx.SaveChanges();
        }
        public IQueryable GetCustoerNameOrders(string custID)
        {
            var query = from c in ctx.Customers
                        from o in ctx.Orders
                        where (c.CustomerID == custID && o.CustomerID == custID)
                        select new { c.CompanyName, o };
            return query;
        }

    }
}