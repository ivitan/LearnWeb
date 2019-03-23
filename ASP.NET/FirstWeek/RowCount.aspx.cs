using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RowCount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rowDTbound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int _count = 0;
            for (int i = 3; i <= 6; i++)
            {
                TableCell mytc = e.Row.Cells[i];
                Single _f = Convert.ToSingle(mytc.Text);
                if (_f < 60) { _count++; }
            }
            if (_count >= 1) { e.Row.Visible = false; }
        }
    }
}