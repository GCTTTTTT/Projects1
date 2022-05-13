package com.example.lrt1.modle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class DAO {

	public User login(Connection conn,User user) throws Exception{
        User resultUser = null;
        // sql
        String sql="select * from users where username=? and password=?";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        pstatement.setString(2, user.getPassword());

        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){ 
            resultUser = new User();
            resultUser.setUsersname(rs.getString("username"));
            resultUser.setPassword(rs.getString("password"));
        }
        
        return resultUser;
    }
	

	public User searchUser(Connection conn,User user) throws Exception {
		User resultUser = null;

        String sql="select * from users where username=?";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());

        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){ 
            resultUser = new User();
            resultUser.setUsersname(rs.getString("username"));
        }
        
        return resultUser;
	}
	

	public boolean register(Connection conn,User user) throws Exception {
		boolean flag = false;
        // sql ��ѯ���
        String sql="insert into users(username,password)values(?,?)";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        pstatement.setString(2, user.getPassword());

        int res = pstatement.executeUpdate();
        if(res > 0) {
        	flag = true;
        }
        return flag;
	}
	
}
