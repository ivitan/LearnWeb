﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Mysqlserver" %>
<%
    if (Session["uid"] == null || Session["uid"].ToString() == "")
    {
        Response.Write("<script>alert(\"请登陆\");window.location.href=\"login.aspx\";</script>");
    }
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
      <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>Order</title>
      <link href="css/template.css" rel="stylesheet"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div id="page">
      <header id="header" class="site-header">
        <nav id="topbar" class="site-topbar visible-lg visible-md">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">Questions? Call us toll free: +1 234 4567 890</div>
              <div class="social-links col-sm-6">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </nav>

        <nav id="navbar" class="site-navbar navbar navbar-static-top one-page-nav" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
              </button>
              <h1 class="navbar-brand"><i class="fa fa-power-off"></i> <a href="index.aspx">Start</a></h1>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
              <ul id="navigation" class="nav navbar-nav navbar-right">
                <li class="active"><a href="#header" class="current">Home</a></li>
                <%
                    if (Session["uid"] != null)
                    {
                        Response.Write("<li><a href=\"jump.aspx\" onclick=\"window.location.href='jump.aspx';\">Admin</a></li>");
                        Response.Write("<li><a href=\"exit.aspx\" onclick=\"window.location.href='exit.aspx';\">Exit</a></li>");
                    }
                    else
                    {
                        Response.Write("<li><a href=\"login.aspx\" onclick=\"window.location.href='login.aspx';\">Login</a></li>");
                        Response.Write("<li><a href='register.aspx' onclick=\"window.location.href='register.aspx';\">Register</a></li>");
                    }
                %>
                <li><a href="#order">Order</a></li>

               
              </ul>
            </div>
          </div>
        </nav>
      </header>

      <main id="main" class="site-main">
        
         <section id="order" class="section section-center section-contact">
          <div class="container">
            <h2 class="section-title"><span>Order Room</span></h2>
            <p>Thanks for you</p>
            <div class="main-action">
              <form id="orderform" runat="server">
                <div class="results"></div>
                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group">
                      <label class="sr-only">房间号</label>
                      <select  class="form-control"  name="room_number">
                          <%
                              string typeid = Request.QueryString["tid"];
                              SqlServerDataBase obj = new SqlServerDataBase();
                              string sql = "select *from [room] where tid='" + typeid + "' and status='empty'";
                              DataSet ds = obj.Select(sql, null);
                              if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
                              {
                                  for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                  {
                                      Response.Write("<option value=\"" + ds.Tables[0].Rows[i][0].ToString() + " \"> " + ds.Tables[0].Rows[i][2].ToString() + "</option>");
                                  }
                              }
                          %>
                      </select>
                    </div>
                    <div class="form-group">
                      <label class="sr-only">房间类型</label>
                      <asp:TextBox ID="room_type" runat="server"  class="form-control" 
                            placeholder="房间类型" require ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="form-group">
                      <label class="sr-only">预定人</label>
                      <asp:TextBox ID="username" runat="server"  class="form-control" placeholder="预定人" 
                            require ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="form-group">
                      <label class="sr-only">价格</label>
                      <asp:TextBox ID="price" runat="server"  class="form-control" placeholder="价格" 
                            require ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="form-group">
                      <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                          <asp:Button ID="submit" runat="server" Text="Submit" 
                                class="btn btn-default btn-block" onclick="submit_Click"></asp:Button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </section>

      </main>

      <footer id="footer" class="site-footer">
        <div class="container">
          <div class="copyright"><p>© 2015 Company, Inc.<br /> Power by <a href="http://weixin.pupued.com">pupued</a></p></div>
        </div>
      </footer>
    </div>

    <div class="scroll-to-top" data-spy="affix" data-offset-top="200"><a href="#page" class="smooth-scroll"><i class="fa fa-arrow-up"></i></a></div>
  
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="js/jquery.singlePageNav.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
  </body>
</html>