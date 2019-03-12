<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tab.aspx.cs" Inherits="tabshili" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../jQuery/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabfirst li").each(function (index) {
                var LiNode = $(this);
                $(this).mouseover(function () {
                    timeoutid = setTimeout(function () {
                        $("div.content").removeClass("content");
                        $("#tabfirst li.tabin").removeClass("tabin");
                        $("#kk>div").eq(index).addClass("content");
                        LiNode.addClass("tabin");
                    }, 500);

                }).mouseout(function () {
                    clearTimeout(timeoutid);
                })

            })

        });
    </script>
    <style type="text/css">
        ul, li
        {
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        li
        {
            float: left;
            display: block;
            background-color: #868686;
            padding: 5px;
            margin-right: 2px;
            border: 1px solid #ffffff;
            color: #fff;
        }
        .tabin
        {
            background-color: #6e6e6e;
            border: 1px solid #6e6e6e;
        }
        .contentfirst
        {
            clear: both;
            background-color: #6e6e6e;
            color: #fff;
            width: 300px;
            height: 100px;
            padding: 10px;
            display: none;
        }
        .content
        {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul id="tabfirst">
            <li class="tabin">标签一</li>
            <li>标签二</li>
            <li>标签三</li>
        </ul>
        <div id="kk">
            <div class="content contentfirst">
                内容一</div>
            <div class="contentfirst">
                内容二</div>
            <div class="contentfirst">
                内容三</div>
        </div>
    </div>
    </form>
</body>
</html>
