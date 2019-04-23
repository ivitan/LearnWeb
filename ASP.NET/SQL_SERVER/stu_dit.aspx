<%@ Page Title="" Language="C#" MasterPageFile="~/SQL_SERVER/MasterPage.master" AutoEventWireup="true" CodeFile="stu_dit.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ContentPlaceHolder1_ListBox2").change(function () {
                var url = "images/";
                $("#ContentPlaceHolder1_Image1").attr("src", url+$(this).val());
            });
            $("#ContentPlaceHolder1_Button1").click(function () {
                var sextext = $("#ContentPlaceHolder1_DropDownList1").find("option:selected").text();
                if (sextext == "—请选择性别—")
                    alert("尚未选择性别");
                var depttext = $("#ContentPlaceHolder1_DropDownList3").find("option:selected").text();

                if (depttext == "—请选择系别—")
                    alert("尚未选择所在系");
                var phototext = $("#ContentPlaceHolder1_ListBox2").find("option:selected").text();

                if (phototext == "")
                    alert("尚未选择照片");

            });
        }); 
    </script>
    <style type="text/css">
        #main
        {
            margin: 0px auto;
            width: 650px;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #ccc;
        }
        span
        {
            font-size: 14px;
            color: #666;
            font-family: 微软雅黑;
        }
        .tupian
        {
            width: 160px;
            height: 200px;
            border: 5px solid #99cccc;
        }
        .left
        {
            float: left;
            padding: 10px;
            margin: 10px;
        }
        #leftinf
        {
            width: 300px;
            border: 1px solid #fff;
            height: 400px;
        }
        #rightinf
        {
            width: 250px;
            border: 1px solid #fff;
        }
        .anniu
        {
            background-image: url(o_04.gif);
            color: #336699;
            width: 80px;
            height: 25px;
            border: 0px;
            float: left;
            margin-right: 20px;
        }
        .anniu:hover
        {
            background-image: url(o_04.gif);
            color: #006633;
            font-weight: bolder;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="main">
        <div id="leftinf" class="left">
            <p>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
            <span>姓名：</span>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="姓名不允许为空！"
                ControlToValidate="txtname" Display="Dynamic"></asp:RequiredFieldValidator>
            <p>
                <span>请选择性别：</span><asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="weixuanze">—请选择性别—</asp:ListItem>
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                <span>年龄：</span>
                <asp:TextBox ID="txtage" runat="server"></asp:TextBox></p>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtage"
                ErrorMessage="请输入数字（除了数值0）" ValidationExpression="[1-9]+(\d)*" Display="Dynamic"></asp:RegularExpressionValidator>
            <p>
                <span>请选择该生的所在系：</span></p>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="所在系" DataValueField="所在系" AppendDataBoundItems="True">
                <asp:ListItem Value="null">—请选择系别—</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:libnewConnectionString4 %>"
                SelectCommand="SELECT distinct [所在系] FROM [s]"></asp:SqlDataSource>
        </div>
        <div id="rightinf" class="left">
            <asp:Image ID="Image1" runat="server" CssClass="tupian" />
            <p>
                <span>请选择该生的照片</span>
            </p>
            <asp:ListBox ID="ListBox2" runat="server" Rows="8" Width="144px" Style="margin-top: 0px;">
            </asp:ListBox>
        </div>
        <div style="clear: both; padding: 10px;">
            <hr />
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="确定" CssClass="anniu1" OnClick="Button1_Click" />
            <a href="Default.aspx">
                <img src="images/user.png" width="101" height="101" border="0" class="anniu" /></a></div>
    </div>
</asp:Content>

