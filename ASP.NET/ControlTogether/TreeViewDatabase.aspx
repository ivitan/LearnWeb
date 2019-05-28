<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeViewDatabase.aspx.cs" Inherits="treeview2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/CSS_DEFAULT.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%=DateTime.Now.ToShortTimeString()%>
    <div id="div_tree"  class="fl">
        <asp:TreeView ID="TreeView1" runat="server" 
            onselectednodechanged="TreeView1_SelectedNodeChanged">
        </asp:TreeView>
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div id="div_imf" class="fr">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate> 
         <%=DateTime.Now.ToShortTimeString()%>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
        </ContentTemplate>
        <Triggers >
        <asp:AsyncPostBackTrigger ControlID="TreeView1" />
        </Triggers>
        </asp:UpdatePanel>
        
       
    </div>
    </div>
    </form>
</body>
</html>
