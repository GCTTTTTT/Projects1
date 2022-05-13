package servlet;

import dao.TagDao;
import dao.TagDaoImpl;
import pojo.Tag;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class EditTag
 */
@WebServlet("/EditTag")
public class EditTag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTag() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("����û�н����ҵķ����أ�������");
		String result = "false";
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = null;
		try {
			//System.out.println("���Ͱ����ͣ�������ҵķ���û���أ���������editTag��");
			int tag_id =  Integer.parseInt(request.getParameter("tag_id"));
			String tag_name = request.getParameter("tag_name");
			Tag t = new Tag();
			t.setTag_id(tag_id);
			t.setTag_name(tag_name);
			TagDao td = new TagDaoImpl();
			boolean flag = td.updataTag(t);
			System.out.println(flag);
			if(flag) {
				result ="true";	
			}
		    writer =  response.getWriter();
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
