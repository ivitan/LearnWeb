using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using newClasses;
using System.Data;
using System.Data.OleDb;

public partial class LESSON_CODE_Login_content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void Page_PreRender(object sender, EventArgs e)
    {
        //本段代码作用: 页面构建最后检测用户登录状态,未登录用户跳转至login.aspx

        //superUserInfo su = (superUserInfo)Session["userInfo"];
        //if (!su.GetIsLogin())
        //{
        //    Response.Redirect("login.aspx");
        //}

    }


    //退出登录
    protected void Button1_Click(object sender, EventArgs e)
    {
        ((superUserInfo)Session["userInfo"]).LogOut();
    }


    //文件下载代码: 未登录用户被禁止下载
    protected void fdownload(object sender, CommandEventArgs e) {
        Boolean _isLogin = ((superUserInfo)Session["userInfo"]).GetIsLogin();
        if (!_isLogin)
        {
            string js = "alert('登录后再下载');location.href='login.aspx';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", js, true);

        }
        else {
            superFile sf = new superFile(int.Parse(e.CommandArgument.ToString()));
            sf.fileDownload();
        }
    }

}