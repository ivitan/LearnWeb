﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SQL_SERVER_addclass : System.Web.UI.Page
{
    SqlConnection sqlconn = new SqlConnection("server=VITAN;uid=sa;pwd=123456;database=libnew");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridViewDataBind();

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string hao = TextBox1.Text;
        string ming = TextBox2.Text;
        float fen = Convert.ToInt16(DropDownList1.SelectedItem.Text);
        float xueqi = Convert.ToInt16(TextBox3.Text);
        bool kai = Convert.ToBoolean(DropDownList2.SelectedItem.Text);

        string sqltext = "insert into c(课程号,课程名,学分,开课学期,是否开设) values ('" + hao + "','" + ming + "','" + fen + "'," + xueqi + ",'" + kai+ "')";
        //  Label1.Text = sqltext;
        SqlCommand cmd = new SqlCommand(sqltext, sqlconn);
        sqlconn.Open();
        int countrecord = cmd.ExecuteNonQuery();


        string sqltext2 = "select * from c";
        SqlCommand cmd2 = new SqlCommand(sqltext2, sqlconn);

        SqlDataReader sdr = cmd2.ExecuteReader();

        GridView2.DataSource = sdr;

        GridView2.DataBind();
        sqlconn.Close();

        TextBox1.Text = TextBox2.Text = TextBox3.Text = "";

    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView theGrid = sender as GridView;
        int newPageIndex = 0;
        if (e.NewPageIndex == -3)
        {
            //点击了Go按钮
            TextBox txtNewPageIndex = null;

            //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
            GridViewRow pagerRow = theGrid.BottomPagerRow;

            if (pagerRow != null)
            {
                //得到text控件
                txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
            }
            if (txtNewPageIndex != null)
            {
                //得到索引
                newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
            }
        }
        else
        {
            //点击了其他的按钮
            newPageIndex = e.NewPageIndex;
        }
        //防止新索引溢出
        newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
        newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

        //得到新的值
        theGrid.PageIndex = newPageIndex;

        //重新绑定

        GridViewDataBind();

    }
    protected void GridViewDataBind()
    {
        SqlConnection sqlconn = new SqlConnection("server=VITAN;uid=sa;pwd=123456;database=libnew");

        string sqltext = "select * from c";
        SqlCommand cmd = new SqlCommand(sqltext, sqlconn);
        // SqlDataReader datar;

        sqlconn.Open();


        SqlDataAdapter ad = new SqlDataAdapter(sqltext, sqlconn);

        DataSet ds = new DataSet();
        ad.Fill(ds, "s");
        GridView2.DataSource = ds;
        GridView2.DataBind();

        sqlconn.Close();
    }

}