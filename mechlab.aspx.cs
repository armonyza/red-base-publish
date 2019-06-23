using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_red
{
    public partial class mechlab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LoginPage.aspx");

            }
        }

        protected void dailyReportBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainTable.aspx");
        }
    }
}