﻿<%@ Page Language="C#" Debug="true"  AutoEventWireup="true" CodeFile="excelToSQL.aspx.cs" Inherits="daoruexcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="导入" onclick="Button1_Click" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    </form>
</body>
</html>
