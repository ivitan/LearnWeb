<%@ Page Language="C#" AutoEventWireup="true" CodeFile="backgroundpos.aspx.cs" Inherits="backgroundpos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #t1
        {
            width: 182px;
            height: 130px;
            background-image: url(./img/design8new.png);
            background-position: 0px 0px;
            margin-right: 10px;
        }
        #t2
        {
            width: 182px;
            height: 130px;
            background-image: url(./img/designnew.png);
            background-position: 0px 0px;
        }
        #t1:hover
        {
            background-position: 0px 131px;
            cursor:pointer;
        }
        #t2:hover
        {
            background-position: 0px 129px;
            cursor:pointer;
        }
        .fl
        {
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="t1" class="fl">
    </div>
    <div id="t2" class="fl">
    </div>
    </form>
</body>
</html>
