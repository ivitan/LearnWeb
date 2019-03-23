<%@ Page Title="" Language="C#" MasterPageFile="../Project/MasterPage.master" AutoEventWireup="true"
    CodeFile="index2.aspx.cs" Inherits="index2" StylesheetTheme="myskin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="faded">
        <div class="rap">
            <a href="#">
                <img style="border: 1px solid #fff; padding: 3px;" src="img/school1.jpg" alt="" width="470"
                    height="400" title="校园春色"></a> <a href="#">
                        <img style="border: 1px solid #fff; padding: 3px;" src="img/school2.jpg" alt="" width="470"
                            height="400" title="教学楼外鲜花盛开"></a> <a href="#">
                                <img style="border: 1px solid #fff; padding: 3px;" src="img/school3.jpg" alt="" width="470"
                                    height="400" title="晨读"></a> <a href="#">
                                        <img style="border: 1px solid #fff; padding: 3px;" src="img/school4.jpg" alt="" width="470"
                                            height="400" title="校园的清晨"></a>
        </div>
    </div>
    <div id="jieshao">
        <ul class="pagination">
            <li><a href="#" rel="0">
                <img src="img/small3.jpg" alt="">
                <span class="left">课程资讯<br />
                    公选课的通知<br />
                </span><span class="right">更换教学楼的通知<br />
                    清明放假通知<br />
                </span>
                <div style="clear: both;">
                </div>
            </a></li>
            <li><a href="#" rel="1">
                <img src="img/small1.jpg" alt="">
                <span class="left">小东湖风景<br />
                    广商交通信息<br />
                    樟子松 </span><span class="right">夏避暑<br />
                        秋赏叶<br />
                        冬玩雪<br />
                    </span>
                <div style="clear: both;">
                </div>
            </a></li>
            <li><a href="#" rel="2">
                <img src="img/small2.jpg" alt="">
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
      		版权所有：<strong>广东省米卡科技有限公司</strong>&nbsp;&nbsp;&nbsp;
            地址：广州市黄埔区九龙广场广商小区B16-4&nbsp;&nbsp;&nbsp;
            电话：400-888-888
      </div>
    </div>
  </footer>
    <link href="grid.css" rel="stylesheet" type="text/css" />
    <script src="jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="jquery.faded.js" type="text/javascript"></script>
    <script src="script.js" type="text/javascript"></script>
</asp:Content>
