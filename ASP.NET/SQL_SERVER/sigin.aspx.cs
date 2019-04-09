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
    public void login()
    {
        string str = "server=VITAN;database=asmin;uid=sa;pwd=123456;Trusted_Connection=no";
        SqlConnection conn = new SqlConnection(str);
        conn.Open();
        string sql = "select * from userInfo where userName=@userName and password=@password";
        SqlCommand comm = new SqlCommand(sql, conn);
        comm.Parameters.Add("userName", TextBox1.Text);
        comm.Parameters.Add("password", TextBox2.Text);
        SqlDataReader sdr = comm.ExecuteReader();
        if (sdr.Read())
        {
            Session["userName"] = TextBox1.Text;
            Session["password"] = TextBox2.Text;
            //lblMessage.Text = "登陆成功！";
            Response.Write("<script>alert('欢迎" + Session["userName"] + ",您成功登录!');location.href='../secure/report/test2.aspx';</script>");
            //Response.Write("<script>alert('登录成功欢迎您');location.href='../secure/report/test2.aspx';</script>");
        }
        else
        {
            lblMessage.Text = "无法登陆，用户名或密码错误！";
            //Response.Redirect("login.aspx");
        }

        //Server.Transfer("../secure/report/test2.aspx");
        //Response.Write("<script>alert('登录成功欢迎您');location.href='../secure/report/test2.aspx';</script>");
        //Response.Write("../secure/report/test.aspx");
        //Response.Redirect("../secure/report/test.aspx");
        conn.Close();




    }
    public void queryUserInfo()
    {
        clsDbAccept cds = new clsDbAccept();
        Session["userName"] = TextBox1.Text;
        Session["password"] = TextBox2.Text;
        string sql = "select * from userInfo where userName='" + Session["userName"] + " 'and password='" + Session["password"] + "'";
        SqlDataReader sdr = null;
        IarDBManager db = new IarDBManager();
        sdr = db.Query(sql);
        if (sdr.Read())
        {
            Session["userName"] = TextBox1.Text;
            Session["password"] = TextBox2.Text;
            //lblMessage.Text = "登陆成功！";
            Response.Write("<script>alert('欢迎" + Session["userName"] + ",您成功登录!');location.href='../secure/report/test2.aspx';</script>");
            //Response.Write("<script>alert('登录成功欢迎您');location.href='../secure/report/test2.aspx';</script>");
        }
        else
        {
            lblMessage.Text = "无法登陆，用户名或密码错误！";
            //Response.Redirect("login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}