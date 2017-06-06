using DataBindingDemoIIT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBindingDemoIIT
{
    public partial class TBD : System.Web.UI.Page
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
        public IQueryable<DataBindingDemoIIT.Model.Customer> GridView1_GetData()
        {
            return dp.GetCustomers();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_UpdateItem(string customerID)
        {
            DataBindingDemoIIT.Model.Customer item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = dp.GetCustomerByID(customerID);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", customerID));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                dp.UpdateCustomer(item);

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_DeleteItem(int id)
        {

        }
    }
}