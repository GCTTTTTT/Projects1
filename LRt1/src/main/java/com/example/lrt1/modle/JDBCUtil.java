package com.example.lrt1.modle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class JDBCUtil {

	private String dbUrl="jdbc:mysql://localhost:3306/blog3?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    private String dbUsername="root";
    private String dbPassword="11111111";
    

    public Connection getConn() {
    	try {

    		Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	Connection conn = null;
    	
    	try {
//    		connection
    		conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return conn;
    }
    

    public void close(ResultSet resultSet) throws Exception {
		if(resultSet != null) {
			resultSet.close();
		}
	}
    

    public void close(Statement statement) throws Exception {
    	if(statement != null) {
    		statement.close();
    	}
    }
    

    public void close(Connection conn) throws Exception {
    	if(conn != null) {
    		conn.close();
    	}
    }
        
//    public static void main(String[] args) {
//    	JDBCUtil dbUtil = new JDBCUtil();
//        try {
//        	Connection conn = dbUtil.getConn();
//        	System.out.println("");
//        	Statement statement = conn.createStatement();
//
//    		String sql = "select * from users";
//
//    		ResultSet rs = statement.executeQuery(sql);
//
//    		while(rs.next()) {
//    			System.out.print(rs.getInt("id")+" ");
//    			System.out.print(rs.getString("username")+" ");
//    			System.out.print(rs.getString("password")+" ");
//    			System.out.println();
//    		}
//    		dbUtil.close(rs);
//    		dbUtil.close(statement);
//    		dbUtil.close(conn);
//    		
//        } catch (Exception e) {            
//            e.printStackTrace();
//        }
//	}
}
