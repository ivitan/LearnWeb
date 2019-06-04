using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using newClasses;
using System.Data;
using System.Data.OleDb;

public partial class LESSON_CODE_LCODE_CLASS : System.Web.UI.Page
{
    superConn mycnn = new superConn("data.mdb");

    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList _ddl = mycnn.GetDDLforTableList();
        _ddl.ID = "ddl_tbllist";
        PlaceHolder1.Controls.Add(_ddl);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = txt_input.Text;
        int i = 0;
        try { i = int.Parse(s); }
        catch { }

        txt_result.Text = (i + 3).ToString();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        superString _s = new superString(txt_input.Text);
        txt_result.Text = (_s.toInt()+3).ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txt_result.Text = (new superString(txt_input.Text)).toDouble().ToString();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        txt_result.Text = (new superString(txt_input.Text)).toDatetime().ToString();
    }


    protected void Button5_Click(object sender, EventArgs e)
    {
        superConn mycnn = new superConn("data.mdb");
        mycnn.open();
        string _sql = "SELECT * FROM T_IMGS";
        OleDbDataReader dr = mycnn.GetDataReader(_sql);

        while (dr.Read()) {
            Response.Write(dr["img_url"].ToString() + "<br>");
        }

        mycnn.close();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        DropDownList _ddl = (DropDownList)PlaceHolder1.FindControl("ddl_tbllist");
        Panel1.Controls.Add( mycnn.GetTable(_ddl.SelectedItem.Text));

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        superConn mycnn = new superConn("data.mdb");
        mycnn.open();
        string _sql1 = "insert into T_IMGS(img_url,img_enable) values ("+"'~/imgs/img7.jpg'"+",0) ";
       // Response.Write(_sql);
        mycnn.insertData(_sql1);
        string _sql2 = "select * from T_IMGS";

        OleDbDataReader dr = mycnn.GetDataReader(_sql2);
        GridView1.DataSource = dr;
        GridView1.DataBind();

        mycnn.close();

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        superConn mycnn = new superConn("data.mdb");
        mycnn.open();
        DataTable dt = mycnn.cnn.GetSchema("Tables",null);
        foreach (DataRow dr in dt.Select("TABLE_TYPE='TABLE'")){
            string s = dr["TABLE_NAME"].ToString();
            Response.Write(s);

        }
        //GridView _gridview = new GridView();
        //_gridview.DataSource = dt;
        //_gridview.DataBind();
        //Panel2.Controls.Add(_gridview);
        mycnn.close();
    }
}