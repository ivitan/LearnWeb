using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;

public partial class daoruexcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   //获取被上传文件的绝对路径
        string filePath = Server.MapPath(this.FileUpload1.PostedFile.FileName);
        //Response.Write(filePath);
        if (filePath != "")
        {
            if (filePath.Contains("xls"))//判断文件是否存在  
            {
                InputExcel(filePath);
            }
            else
            {
                Response.Write("请检查您选择的文件是否为Excel文件！谢谢！");
            }
        }

        else
        {
            Response.Write("请先选择导入文件后，再执行导入！谢谢！");
        }
    }
    public SqlConnection GetCon()
    {
        //实例化SqlConnection对象
        SqlConnection sqlCon = new SqlConnection();
        //实例化SqlConnection对象连接数据库的字符串
        sqlCon.ConnectionString = "server=S404-27\\SQLEXPRESS;uid=sa;pwd=123456;database=libnew";
        return sqlCon;
    }

    private void InputExcel(string pPath)
    {

        string conn = "Provider = Microsoft.Jet.OLEDB.4.0 ; Data Source =" + pPath + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1'";
        OleDbConnection oleCon = new OleDbConnection(conn);
        oleCon.Open();
        string Sql = "select * from [Sheet1$]";
        OleDbDataAdapter mycommand = new OleDbDataAdapter(Sql, oleCon);
        DataSet ds = new DataSet();
        mycommand.Fill(ds, "[Sheet1$]");
        oleCon.Close();
        int count = ds.Tables["[Sheet1$]"].Rows.Count;
        for (int i = 0; i < count; i++)
        {
            string c_no, c_name, P_cno;
            int c_redit, S_emester;
            c_no = ds.Tables["[Sheet1$]"].Rows[i]["Cno"].ToString().Trim();
            c_name = ds.Tables["[Sheet1$]"].Rows[i]["Cname"].ToString().Trim();
            c_redit = Convert.ToInt32(ds.Tables["[Sheet1$]"].Rows[i]["Credit"].ToString().Trim());
            S_emester = Convert.ToInt32(ds.Tables["[Sheet1$]"].Rows[i]["Semester"].ToString().Trim());
            P_cno = ds.Tables["[Sheet1$]"].Rows[i]["Pcno"].ToString().Trim();

            string excelsql = "insert into excel(Cno,Cname, Credit,Semester,Pcno) values ('" + c_no + "','" + c_name + "'," + c_redit + "," + S_emester + ",'" + P_cno + "')";
            try
            {
                //导入到SQL Server中  
                SqlConnection myConn = GetCon();
                SqlCommand sqlcom = new SqlCommand(excelsql, myConn);
                myConn.Open();
                sqlcom.ExecuteNonQuery();

                //重新绑定数据
                myConn.Close();
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", " <script   language=javascript> alert( '数据导入成功! '); </script> ");



            }
            catch (Exception)
            {
                Response.Write("<script language='javascript'>Alert('数据导入失败!');window.location='daoruexcel.aspx'</script>");
            }

        }

    }
}