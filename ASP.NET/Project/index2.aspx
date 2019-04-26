<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="index2.aspx.cs" Inherits="index2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="faded">
        <div class="rap">
            <a href="#">
                <img style="border: 1px solid #fff; padding: 3px;" src="img/ArchLinux.png" alt=""
                    width="250" height="250" title="校园春色"></a> <a href="#">
                        <img style="border: 1px solid #fff; padding: 3px;" src="img/Linux.png" alt="" width="250"
                            height="250" title="教学楼外鲜花盛开"></a> <a href="#">
                                <img style="border: 1px solid #fff; padding: 3px;" src="img/Github.png" alt="" width="250"
                                    height="250" title="晨读"></a> <a href="#">
                                        <img style="border: 1px solid #fff; padding: 3px;" src="img/CSS.png" alt="" width="250"
                                            height="250" title="校园的清晨"></a>
        </div>
    </div>
    <div id="jieshao">
        <ul class="pagination">
            <li><a href="#" rel="0">
                <img src="img/Java.png" alt="">
                <span class="left">课程资讯<br />
                    公选课的通知<br />
                </span><span class="right">更换教学楼的通知<br />
                    清明放假通知<br />
                </span>
                <div style="clear: both;">
                </div>
            </a></li>
            <li><a href="#" rel="1">
                <img src="img/Linux.png" alt="">
                <span class="left">小东湖风景<br />
                    交通信息<br />
                    樟子松 </span><span class="right">夏避暑<br />
                        秋赏叶<br />
                        冬玩雪<br />
                    </span>
                <div style="clear: both;">
                </div>
            </a></li>
            <li><a href="#" rel="2">
                <img src="img/Github.png" alt="">
                <span class="left">交通消息<br />
                    红色旅游<br />
                    篮球比赛的通知<br />
                </span><span class="right">中和门<br />
                    同德殿<br />
                    怀远楼<br />
                </span>
                <div style="clear: both;">
                </div>
            </a></li>
        </ul>
    </div>
    <div style="clear: both;">
    </div>
    <footer>
    <div class="container_16">
    	
      <div id="main">
      		版权所有：<strong>广东省有限公司</strong>&nbsp;&nbsp;&nbsp;
            地址：广州市黄埔区&nbsp;&nbsp;&nbsp;
            电话：400-888-888
      </div>
    </div>
  </footer>
    <link href="csst.css" rel="stylesheet" type="text/css" />
    <script src="jquery-1.8.3.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {

            var i = 0;

            var clone = $("#faded .rap li").first().clone(); //克隆第一张图片
            $("#faded .rap").append(clone);                //复制到列表最后
            var size = $("#faded .rap li").size();         //返回匹配元素的数量
            console.log(size);

            /*循环图片容器的数量，并且向点点按钮的大容器添加几个子节点作为点点按钮*/
            for (var j = 0; j < size - 1; j++) {
                $("#faded  .num").append("<li></li>");
            }

            $("#faded .num li").first().addClass("on");

            /*自动轮播*/
            var t = setInterval(function () {
                i++;
                move();
            }, 2000);

            /*鼠标悬停事件*/
            $("#faded").hover(function () {
                clearInterval(t); //鼠标悬停时清除定时器
            }, function () {
                t = setInterval(function () {
                    i++;
                    move();
                }, 2000); //鼠标移出时开始定时器
            });

            /*鼠标滑入原点事件*/
            $("#faded .num li").hover(function () {

                var index = $(this).index(); //获取当前索引值
                i = index;
                $("#faded .rap").stop().animate({ left: -index * 660 }, 500);
                $(this).addClass("on").siblings().removeClass("on");
            });

            /*向左按钮*/
            $("#faded .btn_l").click(function () {
                i--;
                move();
            })

            /*向右按钮*/
            $("#faded .btn_r").click(function () {
                i++;
                move();
            }) 

            /*移动事件*/
            function move() {
                if (i == size) {
                    $("#faded .rap").css({ left: 0 });
                    i = 1;
                }
                if (i == -1) {
                    $("#faded .rap").css({ left: -(size - 1) * 500 });
                    i = size - 2;
                }
                $("#faded .rap").stop().animate({ left: -i * 250 }, 250);

                if (i == size - 1) {
                    $("#faded .num li").eq(0).addClass("on").siblings().removeClass("on");
                } else {
                    $("#faded .num li").eq(i).addClass("on").siblings().removeClass("on");
                }
            }
        });
    </script>
</asp:Content>
