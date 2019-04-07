<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="gridviewdel.aspx.cs" Inherits="gridviewdel"  MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting"  OnRowDataBound="GridView1_RowDataBound">
     <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                   
                   
                  
                </Columns>
                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

