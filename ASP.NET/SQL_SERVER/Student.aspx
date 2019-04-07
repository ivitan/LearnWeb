<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/SQL_SERVER/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="SQL_SERVER_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</script>
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <hr />
    <div id="charu">
        <div id="insertquyu">
            请输入学号：
            <asp:TextBox ID="TextBox1" runat="server" placeholder="填入学号"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="学号不允许为空！" Display="Dynamic" SetFocusOnError="True" ValidationGroup="r_inserte"
                ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp&nbsp&nbsp&nbsp 请输入姓名：
            <asp:TextBox ID="TextBox2" runat="server" placeholder="填入姓名"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp
            请选择性别：<asp:RadioButton ID="RadioButton1" runat="server" GroupName="sex" Text="男"
                Checked="true" />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="女" />
            <hr style="margin-top: 10px; margin-bottom: 10px;" />
            请输入年龄：
            <asp:TextBox ID="TextBox3" runat="server" placeholder="填入年龄整数"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" MinimumValue="12" MaximumValue="80"
                Type="Integer" ErrorMessage="年龄为12——80之间的整数" ControlToValidate="TextBox3" Display="Dynamic"
                SetFocusOnError="True" ValidationGroup="r_inserte" ForeColor="Red"></asp:RangeValidator>&nbsp&nbsp&nbsp&nbsp
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                DataTextField="所在系" DataValueField="所在系" AppendDataBoundItems="true">
                <asp:ListItem Value="xuanze">--请选择所在系--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:libnewConnectionString3 %>"
                SelectCommand="SELECT distinct [所在系] FROM [s]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" ValidationGroup="r_inserte"
                Style="height: 21px" />
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" OnPageIndexChanging="GridView2_PageIndexChanging"
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
    </div>
</asp:Content>

