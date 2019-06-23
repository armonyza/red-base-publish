using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace Project_red
{
    public partial class apiform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            



        }


       

        protected void weatherBtn_Click(object sender, EventArgs e)
        {
            string weatherString = String.Format("http://api.openweathermap.org/data/2.5/weather?id=1007311&units=metric&appid=2288a597ea771d3d88f2e915385af66c");
            WebRequest requestObjGet = WebRequest.Create(weatherString);
            requestObjGet.Method = "GET";
            HttpWebResponse responseObjGet = null;
            responseObjGet = (HttpWebResponse)requestObjGet.GetResponse();

            string strResult = null;
            using (Stream stream = responseObjGet.GetResponseStream())
            {
                StreamReader sr = new StreamReader(stream);
                strResult = sr.ReadToEnd();
                sr.Close();
            }


            RootObject weatherobj = JsonConvert.DeserializeObject<RootObject>(strResult);

            //JavaScriptSerializer JserializerObj = new JavaScriptSerializer();
            //RootObject weatherObject = (RootObject)JserializerObj.Deserialize(strResult, typeof(RootObject));

            temperature.Text = weatherobj.main.temp.ToString();
            cover.Text = weatherobj.clouds.all.ToString() + '%';
            humidity.Text = weatherobj.main.humidity.ToString() + '%';
        }
    }
}