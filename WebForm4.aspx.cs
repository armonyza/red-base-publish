using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project_red
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            
            using (SqlConnection con = new SqlConnection(CS))
            {

                //connect to datbase
                using (SqlCommand cmd = new SqlCommand("getLogin", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@username", usernameTextBox.Text);
                    cmd.Parameters.AddWithValue("@pwd", passwordTextBox.Text);

                    cmd.Parameters.Add("@returnValue", SqlDbType.VarChar, 255);
                    cmd.Parameters["@returnValue"].Direction = ParameterDirection.Output;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    // use the returned message from sql to succeed or fail
                    string validDetails = cmd.Parameters["@returnValue"].Value.ToString();

                    if (validDetails == "login")
                    {
                        Session["username"] = usernameTextBox.Text;
                        Response.Redirect("MainTable.aspx");

                    }
                    else
                    {
                        loginLabel.Text = "Wrong username or password";
                        loginLabel.Visible = true;
                        //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + validDetails + "');", true);
                    }
                }
            }
        }

        protected void newUserBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewUser.aspx");

        }
    }
}