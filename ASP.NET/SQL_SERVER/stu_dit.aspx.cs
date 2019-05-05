using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

public partial class _Default : System.Web.UI.Page
{

    string photostring;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = "server=S404-27\\SQLEXPRESS;uid=sa;pwd=123456;database=libnew";
        //sqlCon.ConnectionString = "server=VITAN;uid=sa;pwd=123456;database=libnew";


        if (Request.QueryString["xuehao"] != null)
        {
            Label1.Text = "你要修改的学生的学号是：" + Request.QueryString["xuehao"];
        }
        else
        {
            Response.Write("<Script>alert('未选择要编辑的记录！')</script>");
            Server.Transfer("Default.aspx");

        }
        if (!IsPostBack)
        {
            sqlCon.Open();
            //定义SQL语句
            string SqlStr = "select * from s where 学号='" + Request.QueryString["xuehao"].ToString() + "'";
            SqlCommand sqlcom = new SqlCommand(SqlStr, sqlCon);
            SqlDataReader datareader = sqlcom.ExecuteReader();
            while (datareader.Read())
            {
                txtname.Text = datareader["姓名"].ToString();
                txtage.Text = datareader["年龄"].ToString();
                string deptxuanze = datareader["所在系"].ToString();
                photostring = datareader["照片"].ToString();
                Image1.ImageUrl = "images/" + photostring;
            }
            sqlCon.Close();

        }
        //读取所有的照片，照片的文件名加入到ListBox2中。
        sqlCon.Open();
        string SqlStr2 = "select 照片名称 from photo";
        SqlCommand sqlcom2 = new SqlCommand(SqlStr2, sqlCon);
        SqlDataReader datareader2 = sqlcom2.ExecuteReader();
        while (datareader2.Read())
        {
            ListItem _li = new ListItem();
            _li.Value = datareader2["照片名称"].ToString();
            _li.Text = datareader2["照片名称"].ToString();
            ListBox2.Items.Add(_li);

        }

        sqlCon.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = 0;
        string sexxuanze = DropDownList1.SelectedValue.ToString();
        int agexuanze = Convert.ToInt16(txtage.Text);
        string photoxuanze = ListBox2.SelectedValue.ToString();
        string deptxuanze = DropDownList3.SelectedValue.ToString();
        photoxuanze = photoxuanze.Trim();
        //if(sexxuanze=="weixuanze"){ Response.Write("<script>alert('未选择性别')</script>"); }
        // if (deptxuanze == "null") { Response.Write("<script>alert('未选择系别')</script>"); }
        // if (photoxuanze == "") { Response.Write("<script>alert('未选择照片')</script>"); }
        //Response.Write("选择的图片是"+photoxuanze);
        SqlConnection sqlCon = new SqlConnection();
        sqlCon.ConnectionString = "server=S404-27\\SQLEXPRESS;uid=sa;pwd=123456;database=libnew";
        //sqlCon.ConnectionString = "server=VITAN;uid=sa;pwd=123456;database=libnew";
        sqlCon.Open();
        //定义SQL语句

        string updatestring = "update s set 姓名='" + txtname.Text + "',性别='" + sexxuanze + "',年龄=" + agexuanze + ",所在系='" + DropDownList3.SelectedValue.ToString() + "',照片='" + photoxuanze + "' where 学号='" + Request.QueryString["xuehao"].ToString() + "'";
        //Response.Write(updatestring);

        SqlCommand sqlcom = new SqlCommand(updatestring, sqlCon);

        try { i = sqlcom.ExecuteNonQuery(); }
        catch
        {

        }
        if (i == 0)
        {
            Response.Write("<Script>alert('修改记录不成功')</script>");
        }
        else
        {
            Server.Transfer(Request.Url.LocalPath.ToString());
        }

        //  Response.Write(i.ToString());
        // Response.Write(updatestring);
        sqlCon.Close();




    }
    //protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string s1 = ListBox2.SelectedValue;
    //    int i = s1.Length;
    //     //  Response.Write(i.ToString()+"<br/>");
    //      s1=s1.Trim();
    //    int j = s1.Length;
    //   // Response.Write(j.ToString());
    //    Image1.ImageUrl = s1;

    //}


    protected void Button2_Click(object sender, EventArgs e)
    {
        bool fileIsValid = false;
        //如果确认了上传文件，则判断文件类型是否符合要求
        if (this.FileUpload1.HasFile)
        {
            //获取上传文件的后缀
            String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
            String[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png","exe" };
            string pid = TextBox1.Text;

            //判断文件类型是否符合要求
            for (int i = 0; i < restrictExtension.Length; i++)
            {
                if (fileExtension == restrictExtension[i])
                {
                    fileIsValid = true;

                }

            }
            //如果文件类型符合要求,调用SaveAs方法实现上传,并显示相关信息
            if (fileIsValid == true)
            {
                try
                {
                    // this.Image1.ImageUrl ="~/images/"+ FileUpload1.FileName;
                    this.FileUpload1.SaveAs(Server.MapPath("images/") + FileUpload1.FileName);
                    this.Label2.Text = "文件上传成功";
                    this.Label2.Text += "<Br/>";
                    this.Label2.Text += "<li>" + "原文件路径：" + this.FileUpload1.PostedFile.FileName;
                    this.Label2.Text += "<Br/>";
                    this.Label2.Text += "<li>" + "文件大小：" + this.FileUpload1.PostedFile.ContentLength + "字节";
                    this.Label2.Text += "<Br/>";
                    this.Label2.Text += "<li>" + "文件类型：" + this.FileUpload1.PostedFile.ContentType;

                    string name = this.FileUpload1.PostedFile.FileName;

                    SqlConnection sqlCon = new SqlConnection();
                    sqlCon.ConnectionString = "server=S404-27\\SQLEXPRESS;uid=sa;pwd=123456;database=libnew";
                    //sqlCon.ConnectionString = "server=VITAN;uid=sa;pwd=123456;database=libnew";

                    sqlCon.Open();
                    string SqlStr = "insert into photo(编号,照片名称) values ('" + pid + "','" + name + "')";
                    SqlCommand sqlcom = new SqlCommand(SqlStr, sqlCon);
                    int i = sqlcom.ExecuteNonQuery();
                    sqlCon.Close();
                }
                catch
                {
                    this.Label2.Text = "文件上传不成功！";

                }
                finally
                {


                }
            }
            else
            {
                this.Label2.Text = "只能够上传后缀为.gif,.jpg,.bmp,.png的文件";

            }

        }

    }
}