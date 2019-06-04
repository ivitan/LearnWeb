<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LCODE_CLASS.aspx.cs" Inherits="LESSON_CODE_LCODE_CLASS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style type="text/css">
       #Panel2
       {
           margin:auto 0;
           border:1px solid red;
           }
   </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txt_input" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="int" onclick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="double" onclick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="datetime" 
            onclick="Button4_Click"  />
        <br />
        结果:<asp:TextBox ID="txt_result" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="演示查询" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="演示插入" onclick="Button7_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

        <br/>
        <br/>
        <asp:Button ID="Button8" runat="server" Text="演示操作架构" onclick="Button8_Click" />
        <br/>
        <asp:Panel ID="Panel2" runat="server">
        </asp:Panel>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <asp:Button ID="Button6" runat="server" Text="显示表" onclick="Button6_Click" />
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <br />
    </div>
    </form>
</body>
</html>
