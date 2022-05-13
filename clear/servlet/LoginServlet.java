package servlet;

import dao.AdmDao;
import dao.AdmDaoImpl;
import pojo.Adm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * void getSession()�����൱�ڵõ�һ��session���󣬶�void setAttribute()��String Attribute�ֱ��Ƕ����Ը�ֵ�͵õ�����ֵ�ķ�����
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//System.out.println("kkkk");
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		AdmDao a = new AdmDaoImpl();
		Adm adm = a.getAdm(name	, pwd);
		System.out.println(a.toString());
		if(adm!=null) {
			request.getSession().setAttribute("admin",adm);			
			//�ض��򵽳ɹ�ҳ��
			response.sendRedirect("index.jsp"); 
		}else {
			//out.println("����������Ӧ��ת����ʧ�ܵĽ�����");
			request.setAttribute("errMsg", "�˺Ż��������������������Ϣ��");
			//ת����login����
			request.getRequestDispatcher("login.jsp").forward(request, response); 
			return;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
