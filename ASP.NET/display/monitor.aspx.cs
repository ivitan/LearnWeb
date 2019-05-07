using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class monitor : System.Web.UI.Page
{
    string sql_s = "SELECT TB_MONITOR.mo_id, TB_MONITOR.mo_seid, TB_MONITOR.mo_siid, TB_MONITOR.mo_imgid, TB_MONITOR.mo_name, TB_MONITOR.mo_enable, TB_MONITOR.mo_order, TB_MONITOR.mo_delete, TB_MONITOR.mo_phdmi, TB_MONITOR.mo_pvga, TB_MONITOR.mo_pdvi, T_SIZE.si_name, T_SERIES.se_name, T_IMGMNG.img_folder + '/' + T_IMGMNG.img_fname AS imgsrc FROM (((TB_MONITOR INNER JOIN T_IMGMNG ON TB_MONITOR.mo_imgid = T_IMGMNG.img_id) INNER JOIN T_SERIES ON TB_MONITOR.mo_seid = T_SERIES.se_id) INNER JOIN T_SIZE ON TB_MONITOR.mo_siid = T_SIZE.si_id) ";
    string sql_w = " WHERE (TB_MONITOR.mo_delete = false) AND (TB_MONITOR.mo_enable = true) ";
    string sql_o = " ORDER BY TB_MONITOR.mo_order DESC ";

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void menu_se_Click(object sender, BulletedListEventArgs e)
    {
        ListItem _li = menu_se.Items[e.Index];
        _li.Attributes.Add("class", "now");

        string _seid = _li.Value;
        if (_seid != "all")
        {
            sql_w += "AND (mo_seid=" + _seid + ") ";
        }
        ads_lv.SelectCommand = sql_s + sql_w + sql_o;

    }


    protected void menu_si_Click(object sender, BulletedListEventArgs e)
    {
        ListItem _li = menu_si.Items[e.Index];
        _li.Attributes.Add("class", "now");

        string _siid = _li.Value;
        if (_siid != "all")
        {
            sql_w += "AND (mo_siid=" + _siid + ") ";
        }
        ads_lv.SelectCommand = sql_s + sql_w + sql_o;
    }




    protected void Page_PreRenderComplete(object s, EventArgs e)
    {

        int _rowCount = DataPager1.TotalRowCount;


        if (DataPager1.PageSize >= _rowCount)
        {
            p_pager.Style["display"] = "none";
        }
        else
        { p_pager.Style["display"] = "block"; }



    }





}