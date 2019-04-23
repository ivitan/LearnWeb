using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class SQL_SERVER_sigin : System.Web.UI.Page
{
    SqlConnection sqlconn = new SqlConnection("server=VITAN;uid=sa;pwd=123456;database=libnew");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = username.Text;
        string paswd = pwd.Text;
        string name = "";
        string mima = "";
        string reader = "";

        string sqlstr = "select * from [user] where user='" + user + "'and pw='" + paswd + "'";

        sqlconn.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, sqlconn);
        SqlDataReader datar = cmd.ExecuteReader();

        while (datar.Read())
        {
            name = datar["user"].ToString();
            mima = datar["pw"].ToString();
            //reader = datar["读者类型"].ToString();
        }
        sqlconn.Close();

        if (name != "" && mima != "")
        {
            Response.Redirect("Student.aspx");
        }
        else
        {
            Response.Write("<script>alert('用户名或密码错误，请重新登录')</script>");
        }
    }
}