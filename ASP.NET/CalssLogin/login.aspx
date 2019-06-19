<%@ Page Title="" Language="C#" MasterPageFile="~/LESSON_CODE/Login/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="LESSON_CODE_Login_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>    

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:MultiView ID="mv_login" runat="server">
        <asp:View ID="v_login" runat="server">
            <p>登录界面</p>
            <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>    <br />
            <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password"></asp:TextBox>    <br />
            <asp:CheckBox ID="chk_autoLogin" runat="server" Text="自动登录" /><br />
            <asp:Button ID="btn_login" runat="server" Text="登录" onclick="btn_login_Click" />    <br />
        </asp:View>


        <asp:View ID="v_success" runat="server">
            <p>已登录</p>
            <asp:Button ID="btn_logout" runat="server" Text="退出登录" 
                onclick="btn_logout_Click" />
        </asp:View>
    </asp:MultiView> 
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

