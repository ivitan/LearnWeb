<%@ Page Title="" Language="C#" MasterPageFile="~/LESSON_CODE/Login/MasterPage.master" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="LESSON_CODE_Login_content" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" Text="退出登录" onclick="Button1_Click" />
    <br />

    
    <asp:ListView ID="lv_download" runat="server" DataSourceID="ADS_LV"
     ItemPlaceholderID="itemholder">
        <LayoutTemplate>
            <asp:Panel ID="itemholder" runat="server">
            </asp:Panel>
        </LayoutTemplate>

        <ItemTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <asp:LinkButton ID="LinkButton1" runat="server"
                Text='<%#Eval("f_title") %>' 
                OnCommand="fdownload"
                CommandArgument='<%#Eval("f_id") %>'   />
            </asp:Panel>
        </ItemTemplate>

    </asp:ListView>
    <asp:AccessDataSource ID="ADS_LV" runat="server" 
        DataFile="~/App_Data/fileMNG.mdb" SelectCommand="SELECT * FROM [T_files]">
    </asp:AccessDataSource>
</asp:Content>

