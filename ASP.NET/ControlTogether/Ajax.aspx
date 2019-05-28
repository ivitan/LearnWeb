<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ajax.aspx.cs" Inherits="Ajaxshili1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/CSS_DEFAULT.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>111<%=DateTime.Now.ToLongTimeString() %></p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" 
            UpdateMode="Conditional">
        <ContentTemplate>
         <p>222<%=DateTime.Now.ToLongTimeString() %></p>
         <asp:DropDownList ID="ddlsheng" runat="server" AutoPostBack="True" 
            DataSourceID="dssheng" DataTextField="p_name" DataValueField="p_id">
        </asp:DropDownList>
        <asp:AccessDataSource ID="dssheng" runat="server" DataFile="./data/China.mdb" 
            SelectCommand="SELECT [p_id], [p_name] FROM [T_Province]">
        </asp:AccessDataSource>
        <asp:DropDownList ID="ddlshi" runat="server" AutoPostBack="True" 
            DataSourceID="AccessDataSource1" DataTextField="c_name" DataValueField="c_id" 
                OnDataBound="rebound" onselectedindexchanged="ddlshi_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="./data/China.mdb" 
            SelectCommand="SELECT [c_id], [c_name] FROM [T_City] WHERE ([c_pid] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlsheng" Name="c_pid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:DropDownList ID="ddlqu" runat="server" DataSourceID="dsqu" 
            DataTextField="d_name" DataValueField="d_id">
        </asp:DropDownList>
        <asp:AccessDataSource ID="dsqu" runat="server" DataFile="./data/China.mdb" 
            SelectCommand="SELECT [d_id], [d_name] FROM [T_District] WHERE ([d_cid] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlshi" Name="d_cid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlsheng" />
        </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:Label runat="server" Text="" ID="labtime"></asp:Label>
        <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">

        </asp:Timer>
       
        </ContentTemplate>
            
        </asp:UpdatePanel>
        
    </div>
    </form>
</body>
</html>
