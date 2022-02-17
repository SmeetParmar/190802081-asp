<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
</head>
<body>
<table align="center" style="height: 153px; width: 450px">
<tr><td>
   <form id="form1" runat="server">
   <div class="col-md-6">
    <asp:Label ID="Label1" runat="server" Text="Login Form" Font-Bold="True" 
            Font-Italic="True" Font-Size="XX-Large"></asp:Label></tr></td>
  <tr><td><div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"><br/> Username</label>
     <asp:TextBox ID="TextBox1" type="text" class="form-control" runat="server"></asp:TextBox>
  </div></tr></td>
  <tr><td><div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <asp:TextBox ID="TextBox2" type="password" class="form-control" runat="server"></asp:TextBox>
  </div></tr></td>
  <tr><td> <asp:Button ID="Button1" type="submit" class="btn btn-primary" 
          runat="server" Text="Login" onclick="demo" />
    </div>
    </form></tr></td>
    </table>
</body>
</html>
