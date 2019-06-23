<!DOCTYPE html>

<html>
<head>

    <meta charset="utf-8" />
    <title></title>

    <style>

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 10%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:hover {
            background-color: yellow;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

    <h2>HTML Table<asp:Button ID="Button2" runat="server" Text="Button" />
        </h2>
    <p>hello
        </p>
    <table id="activityTable">
        <tr onclick="clicked(this)">
            <th>Description</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <tr onclick="clicked(this)">
            <td>event 1</td>
            <td>date 1</td>
            <td>action 1</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>

    <input id="descBox" type="text"><input id="dateBox" type="text"><input id="actionBox" type="text">
    </br>
    <button onclick="updateRow(selectedRowNumber)">Update</button>
    <br>
    <p>Date: <input type="text" id="datepicker"></p>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
<script src="Scripts/jquery.js"></script>
<script>


var selectedRowNumber;
const picker = datepicker('#datepicker');


function clicked(selectedRow){

  selectedRowNumber = selectedRow.rowIndex;
  document.getElementById("descBox").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[0].innerHTML;
  document.getElementById("dateBox").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[1].innerHTML;
  document.getElementById("actionBox").value = document.getElementById("activityTable").rows[selectedRow.rowIndex].cells[2].innerHTML;
}

function updateRow(selectedRowNumber){

  if(document.getElementById("descBox").value == "" ||document.getElementById("dateBox").value==""||document.getElementById("actionBox").value==""){

    alert("please fill in all the boxes");
  }

else{
  document.getElementById("activityTable").rows[selectedRowNumber].cells[0].innerHTML = document.getElementById("descBox").value;
  document.getElementById("activityTable").rows[selectedRowNumber].cells[1].innerHTML = document.getElementById("dateBox").value;
  document.getElementById("activityTable").rows[selectedRowNumber].cells[2].innerHTML = document.getElementById("actionBox").value;
}



$(document).ready(function(){

$("p").hide()
    });

}

    
</script>

</html>

