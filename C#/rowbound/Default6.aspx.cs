using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rowdtbound(object sender, GridViewRowEventArgs e)
    {
        // Response.Write(e.Row.RowType.ToString()+"<br/>");
        if (e.Row.RowType == DataControlRowType.DataRow)
        {



            TableCell mytd = e.Row.Cells[2];
            TableCell mytd2 = e.Row.Cells[3];
            TableCell mytd3 = e.Row.Cells[4];
          
            DateTime jieshud = Convert.ToDateTime(mytd.Text);
            DateTime huanshud = Convert.ToDateTime(mytd2.Text);
            TimeSpan ts = huanshud -jieshud ;
            int i = ts.Days;
            Response.Write(i.ToString()+"<br/>");
           

           

            if (ts.Days <= 30)
            {
                mytd3.ForeColor = System.Drawing.Color.DarkGreen;
                mytd3.Text = "未超期还书";
            }

            if (ts.Days >30)
            {
                mytd3.ForeColor = System.Drawing.Color.Red;
                mytd3.Text = "已经超期";

            }
        }

    }
}