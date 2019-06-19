package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class goodsop {
	private Statement ps;
	private ResultSet rs;
	private Connection con=null;

	public goodsop()
	{
	
	}
	
	public void close(){
		try{
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(rs!=null){
				rs.close();
				rs=null;				
			}
			if(con!=null){
				con.close();
				con=null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}		    
	}
	
	public ArrayList<goodsBean> getgoodsbynamelike(String tablename,String goodsname){
		ArrayList<goodsBean> goodslist=new ArrayList<goodsBean>();
		try{			
			con=new conndb().getcon();
			System.out.println("$$$$$$$"+goodsname);
			String sqlstr;
            if(goodsname==null ||goodsname.equals("")){
            	sqlstr="select * from " + tablename;
            }else{
            	sqlstr="select * from " + tablename+" where goodsname like '%" + goodsname + "%'";
            }
            System.out.println("//////"+sqlstr);
			//ps=con.prepareStatement(sqlstr);
            ps=con.createStatement();
			//rs=ps.executeQuery();
            rs=ps.executeQuery(sqlstr);
			//System.out.println("cccccccccccccccc"+rs+rs.next());
			
			while(rs.next()){
				goodsBean t=new goodsBean();
				t.setId(rs.getInt(1));
				t.setSectorid(rs.getInt(2));
				t.setProdno(rs.getString(3));
				t.setName(rs.getString(4));
				t.setPic(rs.getString(5));
				t.setInfo(rs.getString(6));
				t.setPrice(rs.getFloat(7));
				t.setNum(rs.getInt(8));
				//System.out.println("vvvvvvvvvvvvv"+t);
				goodslist.add(t);
			}	
            //JOptionPane.showMessageDialog(null, goodslist.size());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		return goodslist;
	}

}
