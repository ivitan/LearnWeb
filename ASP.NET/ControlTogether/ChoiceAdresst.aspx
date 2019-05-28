<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChoiceAdresst.aspx.cs" Inherits="ControlTogether_ChoiceAdresst" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="AccessDataSource1" DataTextField="p_name" DataValueField="p_id">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/ControlTogether/data/China.mdb" 
            SelectCommand="SELECT * FROM [T_Province]"></asp:AccessDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="AccessDataSource2" DataTextField="c_name" DataValueField="c_id" OnDataBound="rebound">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/ControlTogether/data/China.mdb" 
            SelectCommand="SELECT * FROM [T_City] WHERE ([c_pid] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="c_pid"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:DropDownList ID="DropDownList3" runat="server" 
            DataSourceID="AccessDataSource3" DataTextField="d_name" DataValueField="d_id">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/ControlTogether/data/China.mdb" 
            SelectCommand="SELECT * FROM [T_District] WHERE ([d_cid] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="d_cid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
