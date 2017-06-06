using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WingtipToys
{
    public partial class Thankyou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string name = Session["UserName"].ToString();

                SqlConnection conn = new SqlConnection(@"Data Source=(localdb)\ProjectsV13;          
                 Initial Catalog=WingtipToys;Integrated Security=True");
                // drop user's data in cartitem.
                string str = " Delete From CartItems Where CartId = '" + name + "'";
                conn.Open();
                SqlCommand cmd = new SqlCommand(str, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}