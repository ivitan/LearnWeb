using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class SQL_SERVER_sigin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = username.Text;
        string paswd = pwd.Text;
        string name = "";
        string mima = "";

        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = "server=VITAN;uid=sa;pwd=123456;database=libnew";
        string SqlStr = "select * from [user] where user='" + user + "'and pw='" + paswd + "'";
        sqlCon.Open();
        SqlCommand sqlcom = new SqlCommand(SqlStr, sqlCon);
        int i = sqlcom.ExecuteNonQuery();
        SqlDataReader datar = sqlcom.ExecuteReader();
       
        while (datar.Read())
        {
            name = datar["user"].ToString();
            mima = datar["pw"].ToString();
        }
           if (name != "" && mima != "")
        {
            Response.Redirect("Student.aspx");
        }
        else
        {
            Response.Write("<script>alert('用户名或密码错误，请重新登录')</script>");
        }
        sqlCon.Close();
    }
}