package servlet;

import dao.CommentDao;
import dao.CommentDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class DelComment
 */
@WebServlet("/delComment")
public class DelComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("�����Ƿ������delComment����");
		String result = "false";
		PrintWriter writer = null;
		try {
			int id = Integer.parseInt(request.getParameter("comment_id"));
			CommentDao c = new CommentDaoImpl();
			boolean flag = c.delComment(id);
			
			if(flag) {
				result="true";
			}
			writer = response.getWriter();
			writer.write(result);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			writer.flush();
			writer.close();
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
