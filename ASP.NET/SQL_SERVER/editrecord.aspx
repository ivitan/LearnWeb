<%@ Page Title="" Language="C#" MasterPageFile="~/SQL_SERVER/MasterPage.master" AutoEventWireup="true"
    CodeFile="editrecord.aspx.cs" Inherits="SQL_SERVER_editrecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true"
            PageSize="5" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
            OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="年龄" HeaderText="年龄" SortExpression="年龄" />
                <asp:BoundField DataField="所在系" HeaderText="所在系" SortExpression="所在系" />
                <asp:BoundField DataField="照片" HeaderText="照片" SortExpression="照片" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
