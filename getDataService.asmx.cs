using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Project_red
{
    /// <summary>
    /// Summary description for getDataService
    /// </summary>
    [WebService(Namespace = "http://projectred/getDataService")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class getDataService : System.Web.Services.WebService
    {

        [WebMethod]

        //gets the data from the database and puts it into a data holder class object
        public dataHolder getUserTable(string currentUser,string currentDate)
        {

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {

                dataHolder dataHolderObject = new dataHolder();
                SqlCommand cmd = new SqlCommand("getTable", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@username", currentUser);
                cmd.Parameters.AddWithValue("@currentDate", currentDate);
                con.Open();
                //cmd.ExecuteNonQuery();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    //adds each item into a list
                    while (reader.Read())
                    {
                        dataHolderObject.eventItem.Add(reader["eventItem"].ToString());
                        dataHolderObject.dateItem.Add(reader["dateItem"].ToString());
                        dataHolderObject.actionItem.Add(reader["actionItem"].ToString());
                        dataHolderObject.JobID.Add(reader["JobID"].ToString());

                    }

                    return dataHolderObject;

                }

            }
        }

        [WebMethod]
        //updates the database to new values for the appropriate jobID
        public dataHolder updateJobTable(string JobID, string eventItem, string dateItem, string actionItem)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                dataHolder dataHolderObject = new dataHolder();
                SqlCommand cmd = new SqlCommand("updateJobTable", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@jobID", JobID);
                cmd.Parameters.AddWithValue("@eventItem", eventItem);
                cmd.Parameters.AddWithValue("@dateItem", dateItem);
                cmd.Parameters.AddWithValue("@actionItem", actionItem);
                cmd.Parameters.Add("@feedback", SqlDbType.VarChar, 255);
                cmd.Parameters["@feedback"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                dataHolderObject.updateSucess = cmd.Parameters["@feedback"].Value.ToString();

                //'successfully updated'
                return dataHolderObject;
            }
        }

        [WebMethod]
        //adds a new item into the database for the user
        public void newRow(string currentUser, string eventItem, string dateItem, string actionItem)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                dataHolder dataHolderObject = new dataHolder();
                SqlCommand cmd = new SqlCommand("newJobTableRow", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@username", currentUser);
                cmd.Parameters.AddWithValue("@eventItem", eventItem);
                cmd.Parameters.AddWithValue("@dateItem", dateItem);
                cmd.Parameters.AddWithValue("@actionItem", actionItem);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
    }
}


