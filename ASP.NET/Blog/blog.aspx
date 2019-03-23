<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="blogcss1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
        <header class="header">
     <nav>
    <ul>
    <li class="logo"><a href="#">Blog</a></li>
    <li><a href="#">侧栏菜单</a></li>
    <li><a href="#">图片</a></li>
    <li><a href="#">音乐</a></li>
    <li><a href="#">首页</a></li>
    </ul>
    </nav>
    <div class="banner">
    <div class="inner">
    <div class="line"></div>
    <h1>My Blog</h1>
     <div class="line"></div>
     <p>Email:xxx@qq.com</p>
     <p>xxxxxx</p>
     <p>xxxxxx</p>
        <asp:Button ID="Button1" runat="server" Text="别摸我" />
        <div class="more">更多</div>
    </div>
    </div>
    </header>
        <div class="content">
            <section class="part-one">
    <div class="wraper">
            <div>
                <h2>春花秋月何时了</h2>
                <div class="first_title">人间有味，是清欢</div>
                <div class="line"></div>
                <p>清欢，不同于“人生在世不称意，明朝散发弄扁舟”的自我放逐，不同于“人生得意须尽欢，莫使金樽空对月”的尽情欢乐，也不同于“人生不相见，动如参与商”的那种无奈。</p>
            </div>
            <div class="icon">
                <span class="item"><img src="img/21103.png" alt=""></span>
                <span class="item"><img src="img/21104.png" alt=""></span>
                <span class="item"><img src="img/21105.png" alt=""></span>
            </div>
         </div>
    </section>
            <section class="part-two">
            <div class="first">
                 <div class="first_left">
                     <img src="img/pic01.jpg" alt="">
                 </div>
                 <div class="first_text">
                     <h2>思念是一种病</h2>
                     <div class="first_title">我却病入膏肓</div>
                     <p>那一年南国之南，你如灼目之阳。最是那一低头的温柔，恰似水莲花不胜凉风的娇羞</p>
                 </div>
            </div>
            <div class="first">
                <div class="first_text">
                    <h2>北国之春</h2>
                    <div class="first_title">暖阳如你</div>
                    <p>那是我经常走的一条小巷，遇见了你和我的青春</p>
                </div>
                <div class="first_left">
                    <img src="img/pic02.jpg" alt="">
                </div>
            </div>
            <div class="first">
                <div class="first_left">
                    <img src="img/pic03.jpg" alt="">
                </div>
                <div class="first_text">
                    <h2>相信未来</h2>
                    <div class="first_title">妩媚整个秋季</div>
                    <p>当蜘蛛网无情地查封了我的炉台，
                        当灰烬的余烟叹息着贫困的悲哀，
                        我依然固执地铺平失望的灰烬，
                        用美丽的雪花写下：相信未来。
                        当我的紫葡萄化为深秋的露水，</p>
                </div>
            </div>
        </section>
            <section class="part-three">
          <div class="part-three_wrap">
            <div class="three_wrap">
                <h2>相信未来</h2>
                <div class="line">
                </div>
                <div>当我的鲜花依偎在别人的情怀，
                    我依然固执地用凝霜的枯藤，
                    在凄凉的大地上写下：相信未来。
                    我要用手指那涌向天边的排浪，
                    我要用手掌 那托起太阳的大海，
                    摇曳着曙光那支温暖漂亮的笔杆，
                    用孩子的笔体写下：相信未来。</div>
            </div>
            <div class="card_grop clear_fix">
                <div class="card">
                    <h3>believe future</h3>
                    <p>我之所以坚定地相信未来，
                        是我相信未来人们的眼睛——
                        她有拨开历史风尘的睫毛，
                        她有看透岁月篇章的瞳孔。
                         </p>
                </div>
                <div class="card">
                    <h3>believe future</h3>
                    <p>不管人们对于我们腐烂的皮肉，
                        那些迷途的惆怅，失败的苦痛，
                        是寄予感动的热泪，深切的同情，
                        还是给以轻蔑的微笑，辛辣的嘲讽。</p>
                </div>
                <div class="card">
                    <h3>believe future</h3>
                    <p>我坚信人们对于我们的脊骨，
                        那无数次地探索、迷途、失败和成功，
                        一定会给予热情、客观、公正的评定，
                        是的，我焦急地等待着他们的评定。
                         </p>
                </div>
                <div class="card">
                    <h3>believe future</h3>
                    <p>朋友，坚定地相信未来吧，
                        相信不屈不挠的努力，
                        相信战胜死亡的年轻，
                        相信未来，热爱生命。 </p>
                </div>
                <div class="card">
                    <h3>believe future</h3>
                    <p>当蜘蛛网无情地查封了我的炉台，
                        当灰烬的余烟叹息着贫困的悲哀，
                        我依然固执地铺平失望的灰烬，
                        用美丽的雪花写下：相信未来。
                        当我的紫葡萄化为深秋的露水，</p>
                </div>
                <div class="card">
                    <h3>believe future</h3>
                    <p>当我的鲜花依偎在别人的情怀，
                        我依然固执地用凝霜的枯藤，
                        在凄凉的大地上写下：相信未来。
                        我要用手指那涌向天边的排浪，
                        我要用手掌 那托起太阳的大海，
                        摇曳着曙光那支温暖漂亮的笔杆，
                        用孩子的笔体写下：相信未来。 </p>
                </div>
            </div>
          </div>
        </section>
        </div>
        <footer class="footer">
        <ul class="share_group">
            <li>星期一</li>
            <li>星期二</li>
            <li>星期三</li>
            <li>星期四</li>
            <li>星期五</li>
        </ul>
        <div  class="copy">
            &copy 2019
            <a href="vitan.me">Vitan</a>
        </div>

    </footer>
        <div class="mask">
        </div>
    </div>
    </form>
</body>
</html>
