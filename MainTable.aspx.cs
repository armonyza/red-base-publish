using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;


namespace Project_red
{

    public partial class WebForm2 : System.Web.UI.Page
    {

        // kicked user back to login back if they have not logged in properly
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LoginPage.aspx");

            }

            //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{

            //    dataHolder dataHolderObject = new dataHolder();
            //    SqlCommand cmd = new SqlCommand("getTable", con);
            //    cmd.CommandType = CommandType.StoredProcedure;

            //    cmd.Parameters.AddWithValue("@username", "dav");
            //    cmd.Parameters.AddWithValue("@currentDate", "05/16/2019");
            //    con.Open();
            //    //cmd.ExecuteNonQuery();
            //    SqlDataReader reader = cmd.ExecuteReader();
            //    testGrid.DataSource = reader;
            //    testGrid.DataBind();
            //}



        }

        protected void mechLabBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("mechlab.aspx");
        }

        protected void mechLabBtn_Click1(object sender, EventArgs e)
        {
            Response.Redirect("mechlab.aspx");
        }
    }
}