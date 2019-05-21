<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S6_newsLoad.aspx.cs" Inherits="Sample_code_S6_newsLoad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS_NEWS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="div_news">
        <asp:ListView ID="lv_newsDetail" runat="server" DataSourceID="ads_news" ItemPlaceholderID="news_holder">
            <LayoutTemplate>
                <div runat ="server" id="news_holder"></div>
            </LayoutTemplate>

            <ItemTemplate>
                <h1 id="NewsTTL" ><%#Eval("news_title") %></h1>
                <p class ="tc">
                    <span id="NewsDate">日期: <%#Eval("news_date","{0:d}") %></span>
                    <span id="NewsFrom">来源: <%#Eval("news_from") %></span>
                 </p>

                 <div id="newsContent" class ="cke_show_borders">
                    <%#Eval("news_content") %>
                 </div>
            
            </ItemTemplate>


        </asp:ListView>
        <asp:AccessDataSource ID="ads_news" runat="server" DataFile="~/data/news.mdb" 
            SelectCommand="SELECT * FROM [T_NEWS] WHERE ([news_id] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="news_id" 
                    QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
