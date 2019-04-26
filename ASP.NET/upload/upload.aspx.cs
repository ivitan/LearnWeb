using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;


public partial class _Default: System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool fileIsValid = false;
        //如果确认了上传文件，则判断文件类型是否符合要求
        if (this.FileUpload1.HasFile)
        {
            //获取上传文件的后缀
            String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
            String[] restrictExtension ={ ".gif",".jpg",".bmp",".png"};
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
                    this.FileUpload1.SaveAs(Server.MapPath("~/images/") + FileUpload1.FileName);
                    this.Label1.Text = "文件上传成功";
                    this.Label1.Text += "<Br/>";
                    this.Label1.Text += "<li>" + "原文件路径：" + this.FileUpload1.PostedFile.FileName;
                    this.Label1.Text += "<Br/>";
                    this.Label1.Text += "<li>" + "文件大小：" + this.FileUpload1.PostedFile.ContentLength + "字节";
                    this.Label1.Text += "<Br/>";
                    this.Label1.Text += "<li>" + "文件类型：" + this.FileUpload1.PostedFile.ContentType;

                    string name = this.FileUpload1.PostedFile.FileName;

                    SqlConnection sqlCon = new SqlConnection();
                    sqlCon.ConnectionString = "server=VITAN;uid=sa;pwd=123456;database=libnew";
                    sqlCon.Open();
                    string SqlStr = "insert into photo(编号,照片名称) values ('"+ pid + "','" + name + "')";
                    SqlCommand sqlcom = new SqlCommand(SqlStr, sqlCon);
                    int i = sqlcom.ExecuteNonQuery(); 
                    sqlCon.Close();
                }
                catch
                {
                    this.Label1.Text = "文件上传不成功！";

                }
                finally
                {
                   
                
                }
            }
            else 
            {
            this.Label1.Text ="只能够上传后缀为.gif,.jpg,.bmp,.png的文件";
            
            }
            
         }

     }
}

