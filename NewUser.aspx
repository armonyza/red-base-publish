<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="Project_red.NewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="usernameLabel" runat="server" Text="Username :" Font-Names="Courier New" Height="24px"></asp:Label>
        <asp:TextBox ID="usernameTextbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="pwdLabel" runat="server" Text="Password :" Font-Names="Courier New" Height="24px"></asp:Label>
        <asp:TextBox ID="passwordTextbox" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="retypePwdLabel" runat="server" Text="Re-type password :" Font-Names="Courier New" Height="24px"></asp:Label>
        <asp:TextBox ID="retypePwdTextbox" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submitBtn" CssClass="button button1" runat="server" OnClick="submitBtn_Click" Text="Submit" />
        <br />
        <br />
        <asp:Label ID="messageLabel" runat="server" Text="message label" Visible="False" Font-Names="Courier New" Height="24px"></asp:Label>
    </form>
</body>
</html>
