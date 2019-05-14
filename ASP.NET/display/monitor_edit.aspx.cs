using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class Sample2_monitor : System.Web.UI.Page
{   string str_cnn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=";
    string str_sourcefile = "mdb\\EV.mdb";
    OleDbConnection cnn;
    OleDbCommand cmd;
    OleDbDataReader datar;
    string str_sql;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void delmark(object s, CommandEventArgs e) { 
    string str_conn = str_cnn + MapPath(str_sourcefile);
        cnn = new OleDbConnection(str_conn);
        cnn.Open();

        str_sql = "Update Tb_monitor set mo_delete=true " +
            " WHERE mo_id=" + e.CommandArgument.ToString();

        cmd = new OleDbCommand(str_sql, cnn);
        cmd.ExecuteNonQuery();

        cnn.Close();
        ListView1.DataBind();
    }
}