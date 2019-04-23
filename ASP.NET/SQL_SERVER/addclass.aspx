<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/SQL_SERVER/MasterPage.master" AutoEventWireup="true" CodeFile="addclass.aspx.cs" Inherits="SQL_SERVER_addclass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </script>
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <hr />
    <div id="charu">
        <div id="insertquyu">
            请输入课程号：
            <asp:TextBox ID="TextBox1" runat="server" placeholder="填入请输入课程号"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="课程号不允许为空！" Display="Dynamic" SetFocusOnError="True" ValidationGroup="r_inserte"
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            请输入课程名：<asp:TextBox ID="TextBox2" runat="server" placeholder="填入课程名"></asp:TextBox>
            <br />
            请选择学分：<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
            <br />
            请输入开课学期：
            <asp:TextBox ID="TextBox3" runat="server" placeholder="填入开课学期"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" MinimumValue="1" MaximumValue="8"
                Type="Integer" ErrorMessage="1——8之间的整数" ControlToValidate="TextBox3" Display="Dynamic"
                SetFocusOnError="True" ValidationGroup="r_inserte" ForeColor="Red"></asp:RangeValidator>
            <br />
            是否开设课程:<asp:DropDownList ID="DropDownList2" runat="server"
                DataTextField="所在系" DataValueField="是否开设课程" AppendDataBoundItems="true" >
                <asp:ListItem Value="Ture">是</asp:ListItem>
                <asp:ListItem Value="False">否</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" ValidationGroup="r_inserte"
                Style="height: 21px" />
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" OnPageIndexChanging="GridView_PageIndexChanging"
                    AllowPaging="true" PageSize="6">
                    <PagerTemplate>
                        当前第:
                        <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                        页/共:
                        <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                        页
                        <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                            Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                            CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                            Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                            Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                        转到第
                        <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                        <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                            CommandName="Page" Text="GO" />
                    </PagerTemplate>
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" />
            </Triggers>
        </asp:UpdatePanel>
</asp:Content>

