using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class xue : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection("server=VITAN;uid=sa;pwd=123456;database=libnew");

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


        //生成第一级节点
      cnn.Open();
      string str_sql = "select * from xi";
      SqlCommand sqlcom = new SqlCommand(str_sql, cnn);
      SqlDataReader datar =sqlcom.ExecuteReader();
        while(datar.Read()){
            tnode = new TreeNode();
            tnode.Text = datar["xname"].ToString();
            tnode.Value = "p"+datar["xid"].ToString();
            TreeView1.Nodes.Add(tnode);

        }
        cnn.Close();
        //生成第二级节点
        cnn.Open();
        str_sql = "select * from ban";
        sqlcom = new SqlCommand(str_sql, cnn);
        datar = sqlcom.ExecuteReader();
        cnn.Close();
        while (datar.Read())
        {
            pnode = TreeView1.FindNode("p"+datar["xid"].ToString());
            tnode = new TreeNode();
            tnode.Text = datar["bname"].ToString();
            tnode.Value = "c_" + datar["bid"].ToString();
            pnode.ChildNodes.Add(tnode);

        }
        // 生成第三级节点
        cnn.Open();
        str_sql = "SELECT xi.*, ban.* FROM ban INNER JOIN ss ON ban.bid = ss.bid";
        sqlcom = new SqlCommand(str_sql, cnn);
        datar = sqlcom.ExecuteReader();
        cnn.Close();
        while (datar.Read())
        {
            string strpath = "p" + datar["bid"].ToString() + "/c_" + datar["bid"].ToString();

            pnode = TreeView1.FindNode(strpath);
            tnode = new TreeNode();
            tnode.Text = datar["sname"].ToString();
            tnode.Value = "d_" + datar["sid"].ToString();
            pnode.ChildNodes.Add(tnode);

        }

   }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode _tnode;
        _tnode = TreeView1.SelectedNode;

        Label1.Text = _tnode.Text + "[ValuePath:" + _tnode.ValuePath + "]";
    }
}