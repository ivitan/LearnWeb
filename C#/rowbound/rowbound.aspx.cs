using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rowbound : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rowdtbound(object sender, GridViewRowEventArgs e)
    {
        Response.Write(e.Row.RowType.ToString()+"<br/>");
        if (e.Row.RowType == DataControlRowType.DataRow) {

             for (int i = 3; i <= 6; i++)
                  {
                         TableCell mytd = e.Row.Cells[i];

                            if ((Convert.ToSingle(mytd.Text)) < 60) {
                                  mytd.ForeColor = System.Drawing.Color.Red;
                                 }

                            if ((Convert.ToSingle(mytd.Text)) >= 90)
                            {
                                mytd.ForeColor = System.Drawing.Color.Blue;
                            }
                  }

            }
      }
               
}          
       
    
