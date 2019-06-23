<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="Project_red.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>

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

    </style>
</head>
<body>
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
&nbsp;<asp:Label ID="userNameLabel" runat="server" Text="Username :" Font-Names="Courier New" Height="24px"></asp:Label>
            <asp:TextBox ID="usernameTextBox" runat="server" ></asp:TextBox>
        </p>
        <p>
            &nbsp;<asp:Label ID="passwordLabel" runat="server" Text="Password :" Font-Names="Courier New" Height="24px"></asp:Label>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="loginLabel" runat="server" Text="Label" Visible="False" Font-Names="Courier New"></asp:Label>
        </p>
        <p>
            <asp:Button CssClass="button button1" ID="loginBtn" runat="server" OnClick="loginBtn_Click" Text="Login" />
        </p>
        <p>
            <asp:Button CssClass="button button1" ID="newUserBtn" runat="server" Text="New User" Visible="true" OnClick="newUserBtn_Click" />
        </p>
        <div>
        </div>
    </form>
</body>
</html>
