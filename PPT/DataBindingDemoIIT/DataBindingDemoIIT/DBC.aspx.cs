using DataBindingDemoIIT.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataBindingDemoIIT
{
    public partial class DBC : System.Web.UI.Page
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
        public IQueryable<DataBindingDemoIIT.Model.Customer> customerGrid_GetData()
        {
            return dp.GetCustomers();
        }
    }
}