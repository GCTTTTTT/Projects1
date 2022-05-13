package com.example.lrt1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.lrt1.modle.DAO;
import com.example.lrt1.modle.JDBCUtil;
import com.example.lrt1.modle.User;
//import modle.DAO;
//import modle.JDBCUtil;
//import modle.User;


public class HandlePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��ȡ����
		String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String again_password = request.getParameter("again_password").trim();
        //��������ַ�����
        byte[] bytes = username.getBytes("ISO-8859-1");
        username = new String(bytes,"utf-8");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        JDBCUtil db = new JDBCUtil();

        User user = new User(username,password);
        DAO dao = new DAO();
        
        try {

            Connection conn = db.getConn();

            if(dao.searchUser(conn, user) == null) {
	        	out.println("<h2>用户名输入错误！</h2>");
	        	out.println("<h2>请重新输入...</h2>");
            	response.setHeader("Refresh", "3;url=jsp/change_pwd.jsp");
            } else {
				if(!password.equals(again_password)) {
					out.println("<h2>两次输入密码不一致！</h2>");
		        	out.println("<h2>请重新输入...</h2>");
	            	response.setHeader("Refresh", "3;url=jsp/change_pwd.jsp");
				} else {
					String sql="update users set password=? where username=?";
			        // ���ִ��sql���Ķ���
			        PreparedStatement pstatement =conn.prepareStatement(sql);
			        pstatement.setString(1, user.getPassword());
			        pstatement.setString(2, user.getUsername());
			        // ������Ӱ���޸ĵ�����
			        int res = pstatement.executeUpdate();
			        if(res != 0) {
			        	out.println("<h1>密码修改成功！</h1>");
		            	out.println("<h2>正在前往登录页面...</h2>");
		            	response.setHeader("Refresh", "3;url=jsp/login.jsp");
			        } else {
			        	out.println("<h2>密码修改失败！</h2>");
			        	out.println("<h2>请重新输入...</h2>");
		            	response.setHeader("Refresh", "3;url=jsp/change_pwd.jsp");
					}
				}				
			}
        } catch (Exception e) {
        	e.printStackTrace();
		} finally {
			out.close();
		}
	}

}
