<%@ Page Language="C#" AutoEventWireup="true" CodeFile="guanli1.aspx.cs" Inherits="guanli1"
    MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .divItem
        {
            padding: 5px;
        }
        .divBtns
        {
            width: 200px;
        }
        .divinfo
        {
            width: 350px;
            padding: 0px 10px 0px 10px;
            border-left: 1px solid #dadada;
            border-right: 1px solid #dadada;
        }
        .divinfo2
        {
            width: 200px;
        }
        .divBtns, .divinfo, .divinfo2
        {
            float: left;
        }
        .clr
        {
            clear: both;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="AccessDataSource2" ItemPlaceholderID="itemholder"
            DataKeyNames="书籍编号" InsertItemPosition="LastItem">
            <LayoutTemplate>
                <div runat="server" id="itemholder">
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="divItem">
                    <div class="divBtns">
                        <asp:Button ID="btn_edit" runat="server" Text="编辑" CommandName="edit" />
                        <br />
                        <asp:Button ID="btn_delete" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除吗？')" />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="删除挂失书籍" CommandName="waijie" OnCommand="cmd1"
                            CommandArgument='<%#Eval("书籍编号") %>' OnClientClick="return confirm('确定删除吗？')" />
                    </div>
                    <div class="divinfo">
                        <h2>
                            <%#Eval("书籍编号") %></h2>
                        <p>
                            <%#Eval("书籍名称") %></p>
                    </div>
                    <div class="divinfo2">
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("图书状态") %>' Enabled="false"
                            Text="是否挂失" />
                        <p>
                            <%#Eval("排序值") %></p>
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </ItemTemplate>
            <InsertItemTemplate>
                <div class="divItem" style="border: 1px solid red;">
                    <div class="divBtns">
                        <asp:Button ID="btn_insert" runat="server" Text="插入" CommandName="insert" OnClientClick="return confirm('确定插入记录吗？')" />
                        <br />
                        <asp:Button ID="btn_cancel" runat="server" Text="取消" CommandName="cancel" />
                        <br />
                    </div>
                    <div class="divinfo">
                        书籍编号：<asp:TextBox ID="txt_i_bianhao" runat="server" Text='<%#Bind("书籍编号") %>' /><br />
                        书籍名称：<asp:TextBox ID="txt_i_mingcheng" runat="server" Text='<%#Bind("书籍名称") %>' />
                    </div>
                    <div class="divinfo2">
                        <asp:CheckBox ID="chk_i_enable" runat="server" Checked='<%#Bind("图书状态") %>' Text="是否挂失" />
                        排序值：<asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("排序值") %>' />
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </InsertItemTemplate>
            <EditItemTemplate>
                <div class="divItem" style="border: 1px solid bule;">
                    <div class="divBtns">
                        <asp:Button ID="btn_update" runat="server" Text="保存" CommandName="update" OnClientClick="return confirm('确定修改记录吗？')" />
                        <br />
                        <asp:Button ID="btn_cancel" runat="server" Text="取消" CommandName="cancel" />
                        <br />
                    </div>
                    <div class="divinfo">
                        书籍编号：<asp:TextBox ID="txt_e_bianhao" runat="server" Text='<%#Bind("书籍编号") %>' /><br />
                        书籍名称：<asp:TextBox ID="txt_e_mingcheng" runat="server" Text='<%#Bind("书籍名称") %>' />
                    </div>
                    <div class="divinfo2">
                        <asp:CheckBox ID="chk_e_enable" runat="server" Checked='<%#Bind("图书状态") %>' Text="是否挂失" />
                        排序值：<asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("排序值") %>' />
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </EditItemTemplate>
        </asp:ListView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/db/mydatabase.mdb"
            DeleteCommand="DELETE FROM [书籍表2] WHERE ([书籍编号] = ?)" InsertCommand="INSERT INTO [书籍表2] ([书籍编号], [书籍名称] , [图书状态], [排序值]) VALUES (?, ?, ?, ?)"
            SelectCommand="SELECT * FROM [书籍表2] WHERE 图书状态=FALSE" UpdateCommand="UPDATE [书籍表2] SET [书籍名称] = ?,[图书状态] = ?, [排序值] = ? WHERE (([书籍编号] = ?) OR ([书籍编号] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="书籍编号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="书籍编号" Type="String" />
                <asp:Parameter Name="书籍名称" Type="String" />
                <asp:Parameter Name="图书状态" Type="Boolean" />
                <asp:Parameter Name="排序值" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="书籍名称" Type="String" />
                <asp:Parameter Name="书籍封面图" Type="String" />
                <asp:Parameter Name="排序值" Type="Int32" />
                <asp:Parameter Name="书籍编号" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
