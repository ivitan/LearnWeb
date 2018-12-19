<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="读者编号,图书编号" DataSourceID="AccessDataSource1" OnRowDataBound="rowdtbound">
            <Columns>
                <asp:BoundField DataField="读者编号" HeaderText="读者编号" ReadOnly="True" 
                    SortExpression="读者编号" />
                <asp:BoundField DataField="图书编号" HeaderText="图书编号" ReadOnly="True" 
                    SortExpression="图书编号" />
                <asp:BoundField DataField="借书日期" HeaderText="借书日期" SortExpression="借书日期" />
                <asp:BoundField DataField="还书日期" HeaderText="还书日期" SortExpression="还书日期" />
                <asp:BoundField DataField="是否超期" HeaderText="是否超期" SortExpression="是否超期" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/mydatabase.mdb" SelectCommand="SELECT * FROM [借阅]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
