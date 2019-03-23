<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Project_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../jQuery/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#nav>li").hover(function () {
                $(this).children("ul").fadeIn(200);

            }, function () {
                $(this).children("ul").fadeOut(200);
            });
        });
    </script>
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
        }
        body
        {
            background-image: url(img/bg.png);
            background-repeat: no-repeat;
            margin: 0 atuo 50px;
            width: 1020px;
        }
        #banner
        {
            width: 1010px;
            padding: 5px;
            border: 1px solid #ededed;
            background-color:#f40;
            height: 160px;
        }
        #banner p
        {
            font-family: 华文中宋;
            font-size: 48px;
            color: White;
            margin-left: 5px;
            margin-top: 40px;
        }
        #navdiv
        {
            margin-top: 5px;
        }
        #nav
        {
            padding-top: 5px;
            padding-bottom: 5px;
            background-image: url(img/beijing4.jpg);
            background-repeat: repeat-x;
        }
        #nav .first
        {
            display: inline-block;
            padding: 5px 18px 5px 18px;
            border-right: 1px solid #ededed;
            list-style: none;
            font-size: 16px;
            font-family: 宋体;
            color: #999;
            position: relative;
        }
        .first a
        {
            text-decoration: none;
            color: #666;
        }
        .first a:hover
        {
            text-decoration: none;
            color: #eee;
        }
        #nav li ul
        {
            position: absolute;
            display: none;
            top: 33px;
            margin: 0px 0px 0px -25px;
        }
        #nav li ul li
        {
            width: 100px;
            border-bottom: 1px inset;
            list-style: none;
            margin-bottom: 1px;
            padding: 10px 10px 10px 10px;
            background-image: url(img/beijing6.jpg);
            background-repeat: repeat-x;
            font-size: 14px;
            font-family: 微软雅黑;
        }
        #nav li ul li:hover
        {
            background-image: url(img/beijing5.jpg);
            box-shadow: 2px 3px 1px #cc3366;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="banner">
            <p>
                科学管理，高效管理</p>
        </div>
        <div id="navdiv">
            <ul id="nav">
                <li class="first"><a href="#">首页</a></li>
                <li class="first"><a href="#">学生信息</a></li>
                <li class="first"><a href="#">学生信息</a></li>
                <li class="first"><a href="#">学生信息</a></li>
                <li class="first"><a href="#">编辑学生信息</a>
                    <ul>
                        <li class="second"><a href="#">新增</a></li>
                        <li class="second"><a href="#">修改</a></li>
                        <li class="second"><a href="#">删除</a></li>
                    </ul>
                </li>
                <li class="first"><a href="#">编辑课程信息</a>
                    <ul>
                        <li class="second"><a href="#">新增</a></li>
                        <li class="second"><a href="#">修改</a></li>
                        <li class="second"><a href="#">删除</a></li>
                    </ul>
                </li>
                <li class="first"><a href="#">编辑选课信息</a>
                    <ul>
                        <li class="second"><a href="#">新增</a></li>
                        <li class="second"><a href="#">修改</a></li>
                        <li class="second"><a href="#">删除</a></li>
                    </ul>
                </li>
                <li class="first" id="last"><a href="#">联系我们</a></li>
            </ul>
        </div>
        <div>
            <hr />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatrPanel1" runat="server">
                <ContentTemplate>
                    <p style="margin: 10px; color: #777; font-family: 微软雅黑;">
                        欢迎登录学生成绩管理系统。现在时间：<%=DateTime.Now.ToLongTimeString() %></p>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000">
                    </asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
