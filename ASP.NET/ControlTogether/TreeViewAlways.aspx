<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeViewAlways.aspx.cs" Inherits="treeview1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .lev1
        {
            font-size:14px;
            color:#333;
            
            
            }
            .lev2
            {
                font-size:12px;
                color:#666;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TreeView ID="TreeView1" runat="server">
            <LevelStyles>                                                                                                
                <asp:TreeNodeStyle CssClass="lev1" Font-Underline="False" />
                <asp:TreeNodeStyle CssClass="lev2" Font-Underline="False" />
            </LevelStyles>
            <Nodes>
                <asp:TreeNode Text="计算机系" Value="计算机系">
                    <asp:TreeNode Text="信管专业" Value="信管专业"></asp:TreeNode>
                    <asp:TreeNode Text="计算机专业" Value="计算机专业"></asp:TreeNode>
                    <asp:TreeNode Text="电子专业" Value="电子专业"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="会计系" Value="会计系">
                    <asp:TreeNode Text="国际会计" Value="国际会计"></asp:TreeNode>
                    <asp:TreeNode Text="注册会计" Value="注册会计"></asp:TreeNode>
                    <asp:TreeNode Text="财务管理" Value="财务管理"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="经济系" Value="经济系">
                    <asp:TreeNode Text="物流" Value="物流"></asp:TreeNode>
                    <asp:TreeNode Text="电商" Value="电商"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="旅游系" Value="旅游系"></asp:TreeNode>
            </Nodes>
        </asp:TreeView>
        <asp:Button ID="Button1" runat="server" Text="确定" onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="添加" onclick="Button2_Click" />
    </div>
    </form>
</body>
</html>
