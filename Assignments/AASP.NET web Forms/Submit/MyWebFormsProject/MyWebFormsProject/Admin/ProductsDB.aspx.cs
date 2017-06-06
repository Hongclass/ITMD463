using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWebFormsProject.Admin
{
    public partial class ProductsDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton AddCategory = new LinkButton();
            AddCategory.Click += new EventHandler(AddCategory_Click);

        }

        protected void AddCategory_Click(object sender, EventArgs e)
        {
            CategoryDS.InsertParameters["CategoryName"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("NewName")).Text;
            CategoryDS.Insert();
        }

        protected void btn_addprpduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddProduct.aspx");
        }


    }
}
