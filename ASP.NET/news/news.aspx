<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ListView ID="lv_newsDetail" runat="server" DataSourceID="ads_news" ItemPlaceholderID="news_holder">
        <LayoutTemplate>
            <div runat="server" id="news_holder">
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <h1 id="NewsTTL">
                <a href="S6_newsLoad.aspx?id=<%#Eval("news_id") %>">
                    <%#Eval("news_title") %></a></h1>
        </ItemTemplate>
    </asp:ListView>
    <asp:AccessDataSource ID="ads_news" runat="server" DataFile="~/data/news.mdb"
        SelectCommand="SELECT *  FROM [T_NEWS]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
