<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
    <script src="jQuery/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".main>a").click(function () {
                var ulNone = $(this).next("ul");
                if (ulNone.css("display") == "none") {
                    ulNone.css("display", "block");
                }
                else {
                    ulNone.css("display", "none");
                }
                // ulNone.toggle("500");
            });
        });
        $(document).ready(function () {
            $(".hmain>a").click(function () {
                var ulNone = $(this).next("ul");
                ulNone.toggle("500");
            });
            $(".hmain").hover(function () {
                $(this).children("ul").slideDown();
            }, function () {
                $(this).children("ul").slideUp();
            });
        });
    </script>
    <style type="text/css">
        body
        {
        }
        ul
        {
            padding: 0;
            margin: 0;
        }
        ul, li
        {
            list-style: none;
        }
        
        .main, .hmain
        {
            width: 120px;
            background-color: Gray;
            margin-top: 1px;
        }
        .main li, .hmain li
        {
            background-color: #ccc;
        }
        a
        {
            text-decoration: none;
            color: #333;
            display: block;
            width: 80px;
            padding-bottom: 3px;
            padding-top: 3px;
        }
        
        .main a, .hmain a
        {
            color: #fff;
            background-image: url();
            background-repeat: no-repeat;
            background-position: 4px center;
        }
        .main li a, .hmain li a
        {
            color: #666;
            background-image: none;
        }
        .main ul, .hmain ul
        {
            display: none;
        }
        
        .hmain
        {
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul>
            <li class="main"><a href="#">新闻</a>
                <ul>
                    <li><a href="#">国内新闻</a></li>
                    <li><a href="#">国际新闻</a></li>
                </ul>
            </li>
            <li class="main"><a href="#">文学</a>
                <ul>
                    <li><a href="#">诗歌</a></li>
                    <li><a href="#">艺术</a></li>
                    <li><a href="#">散文</a></li>
                </ul>
            </li>
            <li class="main"><a href="#">房产</a>
                <ul>
                    <li><a href="#">楼盘</a></li>
                    <li><a href="#">二手房</a></li>
                    <li><a href="#">租房</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <hr>
    <div>
        <ul>
            <li class="hmain"><a href="#">新闻</a>
                <ul>
                    <li><a href="#">国内新闻</a></li>
                    <li><a href="#">国际新闻</a></li>
                </ul>
            </li>
            <li class="hmain"><a href="#">文学</a>
                <ul>
                    <li><a href="#">诗歌</a></li>
                    <li><a href="#">艺术</a></li>
                    <li><a href="#">散文</a></li>
                </ul>
            </li>
            <li class="hmain"><a href="#">房产</a>
                <ul>
                    <li><a href="#">楼盘</a></li>
                    <li><a href="#">二手房</a></li>
                    <li><a href="#">租房</a></li>
                </ul>
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
