<%@ Page Title="" Language="C#" MasterPageFile="~/SAMPLE_CODE/AMST_SAMPLE.master" AutoEventWireup="true" CodeFile="S6_downloadLink.aspx.cs" Inherits="SAMPLE_CODE_S8_downloadLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH_HEAD" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_MEMO" Runat="Server">
    <ul>
        <li>普通的超链接 &lt;a&gt;有时无法满足下载的需求,而是用浏览器直接打开了文件</li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH_MAIN" Runat="Server">
    <p>普通超链接链接一个图片文件[直接打开]:
        <a href="../imgs/img1.jpg">
           &lt;a href=&quot;../imgs/img1.jpg&quot;/&gt;    </a></p>

    <p>普通超链接链接一个rar文件[下载]:
        <a href="../imgs/temp.rar">
             &lt;a href=&quot;../imgs/temp.rar&quot;/&gt;
        </a>
    </p>

    <p>普通超链接指向一个wav文件[插件或运行环境不同而决定是打开还是下载]:
    <a href="../imgs/music1.wav">
         &lt;a href=&quot;../imgs/music1.wav&quot;/&gt;
    </a></p>


    <p>带有[download]属性的超链接-> 图片 
        <a href="../imgs/img1.jpg" download="myImg.jpg">图片下载</a>
    </p>

    <p style="font-size:16px; color:Red;">完全不暴露目标文件的下载LinkButton
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">图片文件下载</asp:LinkButton>
    </p>

</asp:Content>

