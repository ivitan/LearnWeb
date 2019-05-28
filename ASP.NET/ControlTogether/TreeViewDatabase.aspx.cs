using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class treeview2 : System.Web.UI.Page
    {
    string str_cnn = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=";
    string str_sourcefile = "./data/China.mdb";
    OleDbConnection cnn;
    OleDbCommand cmd;
    OleDbDataReader datar;
    string str_sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            maketree();
        }
    }
    protected void  maketree()
  {    
      TreeNode tnode, pnode;
      String str_conn = str_cnn + MapPath(str_sourcefile);
      cnn = new OleDbConnection(str_conn);
      cnn.Open();

        //生成第一级节点
      str_sql = "select * from T_Province";
      cmd = new OleDbCommand(str_sql,cnn);
      datar=cmd.ExecuteReader();
        while(datar.Read()){
            tnode = new TreeNode();
            tnode.Text = datar["p_name"].ToString();
            tnode.Value = "p"+datar["p_id"].ToString();
            TreeView1.Nodes.Add(tnode);

        }
        //生成第二级节点
        str_sql = "select * from T_City";
        cmd = new OleDbCommand(str_sql, cnn);
        datar = cmd.ExecuteReader();
        while (datar.Read())
        {
            pnode = TreeView1.FindNode("p"+datar["c_pid"].ToString());
            tnode = new TreeNode();
            tnode.Text = datar["c_name"].ToString();
            tnode.Value = "c_" + datar["c_id"].ToString();
            pnode.ChildNodes.Add(tnode);

        }
       // 生成第三级节点
        str_sql = "SELECT T_City.*, T_District.* FROM T_City INNER JOIN T_District ON T_City.c_id = T_District.d_cid";
        cmd = new OleDbCommand(str_sql, cnn);

        datar = cmd.ExecuteReader();
        while (datar.Read())
        {
            string strpath = "p" + datar["c_pid"].ToString() + "/c_" + datar["c_id"].ToString();

            pnode = TreeView1.FindNode(strpath);
            tnode = new TreeNode();
            tnode.Text = datar["d_name"].ToString();
            tnode.Value = "d_" + datar["d_id"].ToString();
            pnode.ChildNodes.Add(tnode);

          


        }

        
       


        
      cnn.Close();
 

   }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode _tnode;
        _tnode = TreeView1.SelectedNode;

        Label1.Text = _tnode.Text + "[ValuePath:" + _tnode.ValuePath + "]";
    }
}