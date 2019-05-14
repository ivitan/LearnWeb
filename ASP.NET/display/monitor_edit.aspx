<%@ Page Language="C#" AutoEventWireup="true" CodeFile="monitor_edit.aspx.cs" Inherits="Sample2_monitor"
    MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="moedit.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#lb_i_img").change(function () {
                $("#img_i_mo").attr("src", $(this).find("option:selected").text());
            });

            $("#lb_e_img").change(function () {
                $("#img_e_mo").attr("src", $(this).find("option:selected").text());
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="box">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ADS_LV" DataKeyNames="mo_id"
            ItemPlaceholderID="itemholder" InsertItemPosition="FirstItem">
            <LayoutTemplate>
                <div runat="server" id="itemholder">
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="Item">
                    <div class="img">
                        <img src='<%#Eval("src") %>' alt="" />
                    </div>
                    <div class="Info">
                        <h3>
                            产品名称:<%#Eval("mo_name") %></h3>
                        <p>
                            系列名称:<%#Eval("se_name") %></p>
                        <p>
                            产品尺寸:<%#Eval("si_name") %></p>
                        <p>
                            接口类型:
                            <%# (Boolean)Eval("mo_phdmi")==true?"HDMI":"" %>
                            <%# (Boolean)Eval("mo_pdvi")==true?"DIV":"" %>
                            <%# (Boolean)Eval("mo_pvga")==true?"VGA":"" %>
                        </p>
                        <p>
                            有效产品:
                            <asp:CheckBox ID="chk_enable" runat="server" Checked='<%#Eval("mo_enable") %>' Enabled="false" />
                        </p>
                    </div>
                    <div class="Btns">
                        <asp:Button ID="btn_edit" runat="server" Text="编辑" CommandName="edit" /><br />
                        <asp:Button ID="btn_delmark" runat="server" Text="删除" OnCommand="delmark" CommandArgument='<%#Eval("mo_id") %>'
                            OnClientClick="return confirm('确定删除?')" />
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </ItemTemplate>
            <ItemSeparatorTemplate>
                <hr />
            </ItemSeparatorTemplate>
            <InsertItemTemplate>
                <div class="Insert">
                    <div class="img">
                        <asp:ListBox ID="lb_i_img" runat="server" DataSourceID="ADS_IMG" DataTextField="IMGSRC"
                            DataValueField="img_id" SelectedValue='<%#Bind("mo_imgid") %>' Rows="7" ClientIDMode="Static">
                        </asp:ListBox>
                        <img alt="" id="img_i_mo" />
                    </div>
                    <div class="Info">
                        <p>
                            产品名称:
                            <asp:TextBox ID="txt_i_name" runat="server" Text='<%#Bind("mo_name") %>' />
                            <asp:RequiredFieldValidator ID="r_i_name" runat="server" ErrorMessage="必须输入产品名称!"
                                CssClass="warn" ValidationGroup="v_insert" SetFocusOnError="true" ControlToValidate="txt_i_name" />
                        </p>
                        <p>
                            系列名称:
                            <asp:DropDownList ID="ddl_i_se" runat="server" DataSourceID="ads_ddl_se" DataTextField="se_name"
                                DataValueField="se_id" SelectedValue='<%#Bind("mo_seid") %>'>
                            </asp:DropDownList>
                        </p>
                        <p>
                            产品尺寸:
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ads_ddl_si" DataTextField="si_name"
                                DataValueField="si_id" SelectedValue='<%#Bind("mo_siid") %>'>
                            </asp:DropDownList>
                        </p>
                        <p>
                            产品接口:
                            <asp:CheckBox ID="chk_i_hdmi" runat="server" Checked='<%#Bind("mo_phdmi") %>' Text="HDMI" />
                            <asp:CheckBox ID="chk_i_dvi" runat="server" Checked='<%#Bind("mo_pdvi") %>' Text="DVI" />
                            <asp:CheckBox ID="chk_i_vga" runat="server" Checked='<%#Bind("mo_pvga") %>' Text="VGA" />
                        </p>
                        <p>
                            有效产品:
                            <asp:CheckBox ID="chk_i_enable" runat="server" Checked='<%#Bind("mo_enable") %>' />
                        </p>
                        <p>
                            排序数值:
                            <asp:TextBox ID="txt_i_order" runat="server" Text='<%#Bind("mo_order") %>' />
                            <asp:RegularExpressionValidator ID="e_i_order" runat="server" ErrorMessage="请输入数值!"
                                ControlToValidate="txt_i_order" CssClass="warn" ValidationExpression="^[0-9]*$"
                                ValidationGroup="v_insert" />
                        </p>
                        <div class="Btns">
                            <asp:Button ID="btn_insert" runat="server" Text="插入记录" CommandName="insert" ValidationGroup="v_insert" />
                            <asp:Button ID="btn_i_cancel" runat="server" Text="取消添加" CommandName="cancel" />
                        </div>
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </InsertItemTemplate>
            <EditItemTemplate>
                <div class="Edit">
                    <div class="Info">
                        <p>
                            产品名称:
                            <asp:TextBox ID="txt_e_name" runat="server" Text='<%#Bind("mo_name") %>' />
                            <asp:RequiredFieldValidator ID="r_e_name" runat="server" ErrorMessage="必须输入产品名称!"
                                CssClass="warn" ValidationGroup="v_update" SetFocusOnError="true" ControlToValidate="txt_e_name" />
                        </p>
                        <p>
                            系列名称:
                            <asp:DropDownList ID="ddl_e_se" runat="server" DataSourceID="ads_ddl_se" DataTextField="se_name"
                                DataValueField="se_id" SelectedValue='<%#Bind("mo_seid") %>'>
                            </asp:DropDownList>
                        </p>
                        <p>
                            产品尺寸:
                            <asp:DropDownList ID="ddl_e_si" runat="server" DataSourceID="ads_ddl_si" DataTextField="si_name"
                                DataValueField="si_id" SelectedValue='<%#Bind("mo_siid") %>'>
                            </asp:DropDownList>
                        </p>
                        <p>
                            产品接口:
                            <asp:CheckBox ID="chk_e_hdmi" runat="server" Checked='<%#Bind("mo_phdmi") %>' Text="HDMI" />
                            <asp:CheckBox ID="chk_e_dvi" runat="server" Checked='<%#Bind("mo_pdvi") %>' Text="DVI" />
                            <asp:CheckBox ID="chk_e_vga" runat="server" Checked='<%#Bind("mo_pvga") %>' Text="VGA" />
                        </p>
                        <p>
                            有效产品:
                            <asp:CheckBox ID="chk_e_enable" runat="server" Checked='<%#Bind("mo_enable") %>' />
                        </p>
                        <p>
                            排序数值:
                            <asp:TextBox ID="txt_e_order" runat="server" Text='<%#Bind("mo_order") %>' />
                            <asp:RegularExpressionValidator ID="e_e_order" runat="server" ErrorMessage="请输入数值!"
                                ControlToValidate="txt_e_order" CssClass="warn" ValidationExpression="^[0-9]*$"
                                ValidationGroup="v_update" />
                        </p>
                        <div class="img">
                            <asp:ListBox ID="lb_e_img" runat="server" DataSourceID="ADS_IMG" DataTextField="IMGSRC"
                                DataValueField="img_id" SelectedValue='<%#Bind("mo_imgid") %>' Rows="7" ClientIDMode="Static">
                            </asp:ListBox>
                            <img alt="" id="img_e_mo" src='<%#Eval("src") %>' />
                        </div>
                        <div class="Btns">
                            <asp:Button ID="btn_update" runat="server" Text="保存修改" CommandName="UPDATE" ValidationGroup="v_update" />
                            <asp:Button ID="btn_e_cancel" runat="server" Text="取消修改" CommandName="cancel" />
                        </div>
                    </div>
                    <div class="clr">
                    </div>
                </div>
            </EditItemTemplate>
        </asp:ListView>
        <asp:AccessDataSource ID="ADS_LV" runat="server" DataFile="~/mdb/EV.mdb" DeleteCommand="DELETE FROM [TB_MONITOR] WHERE [mo_id] = ?"
            InsertCommand="INSERT INTO [TB_MONITOR] ([mo_seid], [mo_siid], [mo_imgid], [mo_name], [mo_enable], [mo_order], [mo_phdmi], [mo_pvga], [mo_pdvi]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            SelectCommand="SELECT TB_MONITOR.* , T_SIZE.si_name, T_SERIES.se_name,img_folder+'/'+img_fname as src FROM T_SIZE INNER JOIN (T_SERIES INNER JOIN (T_IMGMNG INNER JOIN TB_MONITOR ON T_IMGMNG.img_id = TB_MONITOR.mo_imgid) ON T_SERIES.se_id = TB_MONITOR.mo_seid) ON T_SIZE.si_id = TB_MONITOR.mo_siid
WHERE MO_ENABLE=TRUE AND MO_DELETE=FALSE ORDER BY MO_ORDER DESC" UpdateCommand="UPDATE [TB_MONITOR] SET [mo_seid] = ?, [mo_siid] = ?, [mo_imgid] = ?, [mo_name] = ?, [mo_enable] = ?, [mo_order] = ?, [mo_phdmi] = ?, [mo_pvga] = ?, [mo_pdvi] = ? WHERE [mo_id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="mo_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="mo_seid" Type="Int32" />
                <asp:Parameter Name="mo_siid" Type="Int32" />
                <asp:Parameter Name="mo_imgid" Type="Int32" />
                <asp:Parameter Name="mo_name" Type="String" />
                <asp:Parameter Name="mo_enable" Type="Boolean" />
                <asp:Parameter Name="mo_order" Type="Int32" />
                <asp:Parameter Name="mo_phdmi" Type="Boolean" />
                <asp:Parameter Name="mo_pvga" Type="Boolean" />
                <asp:Parameter Name="mo_pdvi" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="mo_seid" Type="Int32" />
                <asp:Parameter Name="mo_siid" Type="Int32" />
                <asp:Parameter Name="mo_imgid" Type="Int32" />
                <asp:Parameter Name="mo_name" Type="String" />
                <asp:Parameter Name="mo_enable" Type="Boolean" />
                <asp:Parameter Name="mo_order" Type="Int32" />
                <asp:Parameter Name="mo_phdmi" Type="Boolean" />
                <asp:Parameter Name="mo_pvga" Type="Boolean" />
                <asp:Parameter Name="mo_pdvi" Type="Boolean" />
                <asp:Parameter Name="mo_id" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_IMG" runat="server" DataFile="~/mdb/EV.mdb" SelectCommand="SELECT img_id, img_folder + '/' + img_fname AS IMGSRC FROM T_IMGMNG">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ads_ddl_si" runat="server" DataFile="~/mdb/EV.mdb" SelectCommand="SELECT [si_id], [si_name] FROM [T_SIZE]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ads_ddl_se" runat="server" DataFile="~/mdb/EV.mdb" SelectCommand="SELECT [se_id], [se_name] FROM [T_SERIES]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
