using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajaxshili1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rebound(object sender, EventArgs e)
    {
        ddlqu.DataBind();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        labtime.Text ="当前系统的时间是："+ DateTime.Now.ToString();
    }
    protected void ddlshi_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}