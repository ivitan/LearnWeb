package javabean;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.swing.JOptionPane;

public class conndb {
	private Connection cn=null;
	
	public Connection getcon(){
	    
		try {
			String url="jdbc:mysql://localhost:3306/onlineshop?user=root&password=&characterEncoding=UTF-8";
			Class.forName("com.mysql.jdbc.Driver");
			//String userName ="root";
			//String password="";
			//cn =DriverManager.getConnection(url,userName,password);
			cn =DriverManager.getConnection(url);
			if(cn==null)
            JOptionPane.showMessageDialog(null, "in conndb");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	    return cn;
	}
}
