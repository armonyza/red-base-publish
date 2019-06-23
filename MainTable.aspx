<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainTable.aspx.cs" Inherits="Project_red.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title></title>


<style>

    body {
  background-color: #f1f1f1;
}
#activityTable {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#activityTable td, #activityTable th {
  border: 1px solid #ddd;
  padding: 8px;
}

#activityTable tr:nth-child(even){background-color: #f2f2f2;}

#activityTable tr:hover {background-color: #ddd;}

#activityTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
    .auto-style1 {
        width: 589px;
    }
    .auto-style2 {
        width: 144px;
    }
    .auto-style3 {
        width: 500px;
    }

    .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.1s; /* Safari */
  transition-duration: 0.1s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
  border-radius: 4px;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}


    .auto-style4 {
        width: 216px;
        height: 50px;
    }


</style>
</head>
<body>

    <form id="MainForm" runat="server">

<h2 style = "font-family:Courier New;font-size:45px;">Daily Report&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="mechLabBtn" runat="server" class="button button1" OnClick="mechLabBtn_Click1" Text="Go To Mechlab " />
        </h2>
<table id="activityTable">
  <tr >
    <th class="auto-style3">Description</th>
    <th class="auto-style2">
        <input id="selectedDay" onchange="getDatabaseTable()" type="text" >
      </th>
    <th class="auto-style1">Action</th>
  </tr>

</table>
        <br />
<label style = "font-family:Courier New;" id="adviseLabel">Enter new item details then press save new item</label>
&nbsp;<br />
        <br />
        <input id="descBox" type="text" placeholder="Description" class="auto-style4">&nbsp;&nbsp;&nbsp; <input id="datepicker" type="text" placeholder="Date" class="auto-style4">&nbsp;&nbsp;&nbsp;<input id="actionBox" type="text" placeholder="Action" class="auto-style4">
        
</br>
<button class="button button1" id="updateBtn" onclick="updateRow(selectedRowNumber)" type ="button">Update</button>&nbsp;&nbsp;&nbsp;
<button class="button button1" id="addItemBtn" onclick="addNewItem()" type="button">Save New Item</button>
<br>
                <asp:ScriptManager ID="ScriptManager2" runat="server">
            <Services>
                <asp:ServiceReference Path="~/getDataService.asmx" />
            </Services>
        </asp:ScriptManager>



    </form>
</body>




<script>
    
    
    var selectedRowNumber;
    var currentDatabaseRow;
    var JobIDArray;
     <%--'<%= Session["userName"] %>'; is required to get the session data--%>

    var currentUser = '<%= Session["userName"] %>';


    // function gets the data from the database by running a webservice and returning a class object and then passing it to ApplyData method 

    function getDatabaseTable()
    {
        // 
        if (document.getElementById("selectedDay").value == "") {
            var currentDate = new Date();
            var dd = String(currentDate.getDate()).padStart(2, '0');
            var mm = String(currentDate.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = currentDate.getFullYear();
            currentDate = mm + '/' + dd + '/' + yyyy;
            currentDate.toString();
            //document.getElementById("selectedDay").value = currentDate;
            $("#selectedDate").value = currentDate;
            Project_red.getDataService.getUserTable(currentUser, currentDate, ApplyData);
        }
        else
        {

            currentDate = document.getElementById("selectedDay").value;

            

            Project_red.getDataService.getUserTable(currentUser, currentDate, ApplyData);
        }
        


    } 

    //ApplyData takes the passed class object and draws a table with the properties of the object into the main table
    
function ApplyData(result)
    {

    // count how many rows the table mgiht already have
    var currentRows = document.getElementById("activityTable").getElementsByTagName("tr").length;
    var i = 0;

    //if there are already rows in the table from the database then clear table
    if (currentRows > 1)
    {

        var table = document.getElementById("activityTable");
        //or use :  var table = document.all.tableid;
        for(var i = table.rows.length - 1; i > 0; i--)
         {
            table.deleteRow(i);
        }
    }

    // but the returned items into arrays so it can be looped through onto the the table
    JobIDArray = result["JobID"].toString().split(',');
    var eventItemsArray = result["eventItem"].toString().split(',');
    var dateItemArray = result['dateItem'].toString().split(',');
    var actionItemArray = result['actionItem'].toString().split(',');
    currentDatabaseRow = result['JobID'];
    
    var len = dateItemArray.length;

    //if statement to stop the row being drawn if there is no items returned
    if (dateItemArray[0] != "") {
        for (; i < len;) {
            var table = document.getElementById("activityTable");
            var row = table.insertRow(i + 1);
            row.setAttribute("onclick", "clicked(this)");
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            cell1.innerHTML = eventItemsArray[i];
            cell2.innerHTML = dateItemArray[i];
            cell3.innerHTML = actionItemArray[i];
            i++;
        }
    }


    }

    // function to take the clicked table row and but their values into the tex boxes 
    function clicked(selectedRow) {
        
          selectedRowNumber = selectedRow.rowIndex;
        //alert(selectedRowNumber);
        document.getElementById("descBox").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[0].innerHTML;
        document.getElementById("datepicker").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[1].innerHTML;
        document.getElementById("actionBox").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[2].innerHTML;

        document.getElementById("adviseLabel").innerHTML = "update the items information then press update button";
    }

    //function to update the selected row on the 
    function updateRow(selectedRowNumber) {

        if (document.getElementById("descBox").value == "" || document.getElementById("datepicker").value == "" || document.getElementById("actionBox").value == "") {

            alert("please fill in all the boxes");
        }

        else {
            document.getElementById("activityTable").rows[selectedRowNumber].cells[0].innerHTML = document.getElementById("descBox").value;
            var desc = document.getElementById("descBox").value;
            document.getElementById("activityTable").rows[selectedRowNumber].cells[1].innerHTML = document.getElementById("datepicker").value;
            var date = document.getElementById("datepicker").value;
            document.getElementById("activityTable").rows[selectedRowNumber].cells[2].innerHTML = document.getElementById("actionBox").value;
            var action = document.getElementById("actionBox").value;

            //call the updatejobtable webservice to update the database 
            // selectedRowNumber-1 because selectedRowNumber = selectedRow.rowIndex is 1 greater than the length of the array
            Project_red.getDataService.updateJobTable(JobIDArray[selectedRowNumber-1],desc,date,action,updateSucess);
            document.getElementById("adviseLabel").innerHTML = "Enter new item details then press save new item";
            document.getElementById("descBox").value = "";
            document.getElementById("datepicker").value = "";
            document.getElementById("actionBox").value = "";
        }


        //calls a pop up method about whether it succeeded or failed in SQL
        function updateSucess(result)
        {
            if (result['updateSucess'] == 'successfully updated')
            {
                alert(result['updateSucess']);
            }
            
            else
            {
                alert(result['updateSucess']);
            }
        }


        

    }

    //calls webservice to add a new row on to the database
    function addNewItem()
    {
        if (document.getElementById("descBox").value == "" || document.getElementById("datepicker").value == "" || document.getElementById("actionBox").value == "") {

            alert("please fill in all the boxes");
        }

        var newDesc = document.getElementById("descBox").value;
        var newDate = document.getElementById("datepicker").value;
        var newAction = document.getElementById("actionBox").value;

        Project_red.getDataService.newRow(currentUser,newDesc,newDate,newAction,getDatabaseTable);


    }

    function testFunction()
    {
        alert('test asp');
    }

    //calls a datepicker for the select date drop downs
    $( "#datepicker" ).datepicker({
  altFormat: "yy-mm-dd"
    });

$( "#selectedDay" ).datepicker({
  altFormat: "yy-mm-dd"
    });

    //calls getDatabaseTable at the end so that it does not run before the document is finished loading
    window.onload = getDatabaseTable();


</script>


  



</html>
