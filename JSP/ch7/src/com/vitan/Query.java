package com.vitan;
import java.sql.*;

public class Query {
	String databaseName = "";
	String tableName = "";
	String user = "";
	String password = "71017";
	StringBuffer queryResult;
	
	public Query() {
		// TODO Auto-generated constructor stub
		queryResult = new StringBuffer();
		try{  Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e){} 
	}

	public String getDatabaseName() {
		return databaseName;
	}

	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public StringBuffer getQueryResult() {
		Connection con;//�������ݿ����Ӷ���
	    Statement sql; //�������ݿ��������
	    ResultSet rs;//�������������
	    try{  queryResult.append("<table border=1>"); //׷��<table border=1>��result��ĩβ
	          String uri="jdbc:mysql://127.0.0.1/"+ databaseName;//�������ݿ��·��
	          con=DriverManager.getConnection(uri,user,password);//���������ݿ������
	          DatabaseMetaData metadata=con.getMetaData();//����Ԫ���ݶ���
	          ResultSet rs1=metadata.getColumns(null,null,tableName,null);
	          int number2=0;//��һ����������ʾ�ֶεĸ���
	          queryResult.append("<tr>");//׷��<tr>��result��ĩβ
	          while(rs1.next()){//�����ͷ
	             number2++;
	             String clumnName=rs1.getString(4);
	             queryResult.append("<td>"+clumnName+"</td>");
	          }
	          queryResult.append("</tr>");
	          sql=con.createStatement();
	          rs=sql.executeQuery("SELECT * FROM "+tableName);//ִ�в�ѯ���
	          while(rs.next()){//������еļ�¼
	        	  queryResult.append("<tr>");
	               for(int k=1;k<=number2;k++) 
	            	   queryResult.append("<td>"+rs.getString(k)+"</td>");
	               queryResult.append("</tr>");
	          }
	          queryResult.append("</table>");
	rs1.close();
	rs.close();
	sql.close();
	          con.close();
	    }
	    catch(SQLException e){
	    	queryResult.append("��������ȷ���û���������");
	}
		return queryResult;
	}

}