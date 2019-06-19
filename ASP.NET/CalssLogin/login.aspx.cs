using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using newClasses;

public partial class LESSON_CODE_Login_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //登录动作
    protected void btn_login_Click(object sender, EventArgs e)
    {
        superUserInfo su = (superUserInfo)Session["userInfo"];
        su.userID = txt_id.Text;
        su.userPWD = txt_pwd.Text;
        su.autoLogin = chk_autoLogin.Checked;
        if (su.tryLogin()) {
            su.SetCookies();
        }
    }


    //page_preRender
    protected void Page_PreRender(object sender, EventArgs e) 
    {
        superUserInfo su = (superUserInfo)Session["userInfo"];
        if (su.GetIsLogin())
        {
            mv_login.SetActiveView(v_success);
        }
        else
        {
            mv_login.SetActiveView(v_login);
        }
    }

    //退出登录
    protected void btn_logout_Click(object sender, EventArgs e)
    {
        ((superUserInfo)Session["userInfo"]).LogOut();
    }
}