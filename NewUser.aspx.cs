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
    public partial class NewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            messageLabel.Visible = true;
            if (usernameTextbox.Text == "" || passwordTextbox.Text == "")
            {
                messageLabel.Text = "username or password cannot be empty";
            }

            else
            {               

                if (passwordTextbox.Text == retypePwdTextbox.Text)
                {

                    string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(CS))
                    {


                        SqlCommand cmd = new SqlCommand("NewUsers", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@username", usernameTextbox.Text);
                        cmd.Parameters.AddWithValue("@pwd", passwordTextbox.Text);

                        cmd.Parameters.Add("@confirmation", SqlDbType.VarChar, 255);
                        cmd.Parameters["@confirmation"].Direction = ParameterDirection.Output;

                        con.Open();
                        cmd.ExecuteNonQuery();
                        string validDetails = cmd.Parameters["@confirmation"].Value.ToString();

                        if (validDetails == "success")
                        {

                            Server.Transfer("LoginPage.aspx", true);
                        }
                        else
                        {
                            messageLabel.Text = validDetails;

                        }
                    }
                }
                else
                {
                    messageLabel.Text = "The passwords do not match";
                }
            }
        }
    }
}