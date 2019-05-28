using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class treeview1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TreeNode tnode;
        tnode = TreeView1.SelectedNode;
        Response.Write(tnode.Text + "<br/>");
        Response.Write(tnode.Value + "<br/>");
        Response.Write(tnode.ValuePath + "<br/>");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TreeNode tnode=new TreeNode();
        tnode.Text = "新增专业";
        tnode.Value = "新增专业";

        TreeView1.Nodes.Add(tnode);


        TreeNode pnode;
        pnode = TreeView1.FindNode("计算机系");
        pnode = TreeView1.SelectedNode;

        pnode.ChildNodes.Add(tnode);





    }
}