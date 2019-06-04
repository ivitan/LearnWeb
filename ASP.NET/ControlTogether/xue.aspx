<%@ Page Language="C#"  Debug="true" AutoEventWireup="true" CodeFile="xue.aspx.cs" Inherits="xue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%=DateTime.Now.ToShortTimeString()%>
            <div id="div_tree" class="fl">
                <asp:TreeView ID="TreeView1" runat="server"
                    OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
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
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="TreeView1" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
