<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rowbound.aspx.cs" Inherits="rowbound" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="学号" DataSourceID="AccessDataSource1"  
            OnRowDataBound="rowdtbound">
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" 
                    ReadOnly="True" SortExpression="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="数据库原理" HeaderText="数据库原理" SortExpression="数据库原理" />
                <asp:BoundField DataField="大学英语" HeaderText="大学英语" SortExpression="大学英语" />
                <asp:BoundField DataField="高等数学" HeaderText="高等数学" SortExpression="高等数学" />
                <asp:BoundField DataField="系统分析" HeaderText="系统分析" SortExpression="系统分析" />
                <asp:BoundField DataField="学生籍贯" HeaderText="学生籍贯" SortExpression="学生籍贯" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/tianpingdian.mdb" SelectCommand="SELECT * FROM [成绩实例]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
