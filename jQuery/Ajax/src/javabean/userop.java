package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class userop {
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection con=null;

	public userop()
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
	
	public boolean checkusername(String username){
		try{
			con=new conndb().getcon();
			String sqlstr= "select * from user where username='"+username+"'";
			ps=con.prepareStatement(sqlstr);
			rs=ps.executeQuery();
			//如果查找结果不为空
			if(rs.next()){				
				return true;
			}else{
				return false;
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close();
		}
		return false;
}

}
