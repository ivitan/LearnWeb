<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="SQL_SERVER_sigin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
            <asp:TextBox ID="username" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="密    码："></asp:Label>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </form>
</body>
</html>
