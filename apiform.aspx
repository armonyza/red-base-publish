<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apiform.aspx.cs" Inherits="Project_red.apiform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <asp:Button ID="weatherBtn" runat="server" OnClick="weatherBtn_Click" Text="Get Durban Weather !" />
        <br />
        </br>
        Cloud cover :
    <asp:Label ID="cover" runat="server" Text="cover"></asp:Label>
        <br />
        Tempurature :
    <asp:Label ID="temperature" runat="server" Text="temperature"></asp:Label>

        <br />
&nbsp;Humidity:
        <asp:Label ID="humidity" runat="server" Text="humidity"></asp:Label>

    </form>

</body>

<script>



</script>
</html>
