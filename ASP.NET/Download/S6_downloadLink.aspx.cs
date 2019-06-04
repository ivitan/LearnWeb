using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SAMPLE_CODE_S8_downloadLink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string fileName = "tempImg.jpg";
        string filePath = Server.MapPath("~/imgs/img3.jpg");

        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.ContentType = "application/unknow";
        Response.TransmitFile(filePath);
        Response.End();

    }

}