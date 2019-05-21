<%@ Page Language="C#" AutoEventWireup="true" CodeFile="monitor.aspx.cs" Inherits="monitor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="monitor.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%--
这是一个功能不完整的产品列表模块.
注意点:
1. 分页控件显示控制
2. 分组,
3. EmptyitemTemplate
4. pagesize 和 groupCount 不匹配时,EmptyItemTemplate出现的情况
5. 利用javaScript代码实现图片点击跳转页面
6. 在BulletedList中追加数据项
    --%>
    <form id="form1" runat="server">
    <div style="width: 760px; margin: 0px auto;">
        <h2>
            完整产品列表模块</h2>
        <h3>
            菜单栏+ListView+分页控件 / 分页控件按需显示</h3>
        <hr />
        <div id="div_menu">
            <p class="title">
                产品系列</p>
            <asp:BulletedList ID="menu_se" runat="server" DataSourceID="ADS_L_SE" DisplayMode="LinkButton"
                DataTextField="se_name" DataValueField="se_id" OnClick="menu_se_Click" AppendDataBoundItems="True">
                <asp:ListItem Value="all">全系列</asp:ListItem>
            </asp:BulletedList>
            <p class="title">
                产品尺寸</p>
            <asp:BulletedList ID="menu_si" runat="server" DataSourceID="ADS_L_SI" DisplayMode="LinkButton"
                DataTextField="si_name" DataValueField="si_id" OnClick="menu_si_Click" AppendDataBoundItems="True">
                <asp:ListItem Value="all">全部尺寸</asp:ListItem>
            </asp:BulletedList>
        </div>
        <div id="div_main">
            <div id="div_condition">
                <div class="title">
                    <p class="fl" style="color: White;">
                        产品列表
                    </p>
                    <p class="fr" id="p_pager" runat="server">
                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lv_mo" PageSize="3">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </p>
                    <div class="clr">
                    </div>
                </div>
                <div id="div_prod">
                    <asp:ListView ID="lv_mo" runat="server" DataSourceID="ads_lv" GroupPlaceholderID="groupholder"
                        GroupItemCount="2" ItemPlaceholderID="itemholder">
                        <LayoutTemplate>
                            <div runat="server" id="groupholder">
                            </div>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <div runat="server" id="itemholder">
                            </div>
                            <div class="clr">
                            </div>
                        </GroupTemplate>
                        <GroupSeparatorTemplate>
                            <hr />
                        </GroupSeparatorTemplate>
                        <ItemTemplate>
                            <div style="width: 295px; float: left; text-align: center;">
                                <img src='<%#Eval("imgsrc") %>' width="240px" height="180px" title="点击查看详情" style="cursor: pointer;"
                                    onclick="<%#Eval("mo_id","javascript:location='prod.aspx?moid={0}'") %>" />
                                <p class="moname">
                                    <%#Eval("mo_name") %>
                                    [
                                    <%#Eval("se_name") %>
                                    ]/<%#Eval("si_name") %></p>
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <p style="text-align: center;">
                                对不起,没有相关产品!</p>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <div style="text-align: center; padding: 20px 5px;">
                                <a href="">新产品链接 </a>
                                <br />
                                <a href="">促销产品链接 </a>
                            </div>
                        </EmptyItemTemplate>
                    </asp:ListView>
                </div>
                <div id="div_pager" style="text-align: center;">
                </div>
            </div>
        </div>
    </div>
    <div id="div_hidden">
        <asp:AccessDataSource ID="ADS_L_SE" runat="server" DataFile="~/display/mdb/EV.mdb" SelectCommand="SELECT se_name, se_id FROM T_SERIES WHERE (se_enable = true) AND (se_delete = false) ORDER BY se_order DESC">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_L_SI" runat="server" DataFile="~/display/mdb/EV.mdb" SelectCommand="SELECT si_id, si_name FROM T_SIZE WHERE (si_enable = true) AND (si_delete = false) ORDER BY si_order DESC">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ads_lv" runat="server" DataFile="~/display/mdb/EV.mdb" SelectCommand="SELECT TB_MONITOR.mo_id, TB_MONITOR.mo_seid, TB_MONITOR.mo_siid, TB_MONITOR.mo_imgid, TB_MONITOR.mo_name, TB_MONITOR.mo_enable, TB_MONITOR.mo_order, TB_MONITOR.mo_delete, TB_MONITOR.mo_phdmi, TB_MONITOR.mo_pvga, TB_MONITOR.mo_pdvi, T_SIZE.si_name, T_SERIES.se_name, T_IMGMNG.img_folder + '/' + T_IMGMNG.img_fname AS imgsrc FROM (((TB_MONITOR INNER JOIN T_IMGMNG ON TB_MONITOR.mo_imgid = T_IMGMNG.img_id) INNER JOIN T_SERIES ON TB_MONITOR.mo_seid = T_SERIES.se_id) INNER JOIN T_SIZE ON TB_MONITOR.mo_siid = T_SIZE.si_id) WHERE (TB_MONITOR.mo_delete = false) AND (TB_MONITOR.mo_enable = true) ORDER BY TB_MONITOR.mo_order DESC">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
