using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Project_red
{
    //returns object that holds lists of the returned data from the database
    public class dataHolder
    {

        public DataTable sourceTable;
        public List<string> eventItem = new List<string>();
        public List<string> dateItem = new List<string>();
        public List<string> actionItem = new List<string>();
        public List<string> JobID = new List<string>();
        public List<string> currentDate = new List<string>();
        public string updateSucess { get; set; }
        
    }
}