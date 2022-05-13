package com.example.lrt1.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import com.example.lrt1.modle.DAO;
import com.example.lrt1.modle.JDBCUtil;
import com.example.lrt1.modle.JsonResult;
import com.example.lrt1.modle.User;
//import modle.DAO;
//import modle.JDBCUtil;
//import modle.JsonResult;
//import modle.User;



public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		

        String username = request.getParameter("username");        
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");
                
        System.out.println(password);
        System.out.println(email);
        System.out.println(code);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        

        if(username != null && password != null) {
            //��������ַ�����
            byte[] bytes = username.getBytes("ISO-8859-1");
            username = new String(bytes,"utf-8");
            System.out.println(username);
            
        	JDBCUtil db = new JDBCUtil();

            User user = new User(username,password);
            DAO dao = new DAO();
            try {
                //���ݿ�����
                Connection conn = db.getConn();
                
                if(dao.login(conn, user) != null) {
                	request.getSession().setAttribute("user", user);
//                	response.sendRedirect("jsp/uploadShow2_div.jsp");
                	response.sendRedirect("jsp/new_fir_page.jsp");
                } else {
                	out.println("<h1>用户名或密码错误！</h1>");
                	out.println("<h2>请重新登录...</h2>");
                	response.setHeader("Refresh", "3;url=jsp/login.jsp");
                }            
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
    			out.close();
    		}
        } else if(email != null && code != null) {

        	String s_emailCode = (String)request.getSession().getAttribute("emailCode");
        	JsonResult jr = new JsonResult();
        	if(!code.equalsIgnoreCase(s_emailCode)) {
            	out.println("<h1>验证码输入错误！</h1>");
            	out.println("<h2>请重新登录...</h2>");
            	response.setHeader("Refresh", "3;url=jsp/login.jsp");
        	} else {
//        		response.sendRedirect("jsp/uploadShow2_div.jsp");
        		response.sendRedirect("jsp/new_fir_page.jsp");
        	}
        	out.close();
        }
        
	}

}
