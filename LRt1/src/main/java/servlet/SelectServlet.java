package servlet;

import dao.CategoryDao;
import dao.CategoryDaoImpl;
import pojo.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/selectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ָ�����صĸ�ʽΪjson��ʽ
		//response.setContentType("application/json;charset=utf-8");
		//PrintWriter writer = null;
		try {
			//System.out.println("���Ͱ����ͣ�������ҵķ���û���أ���������select��");
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			CategoryDao c = new CategoryDaoImpl();
			Category c1 = c.getOneCategory(category_id);
			//Map<String, Object> map = new HashMap<String, Object>();
			if(c1!=null) {
				//System.out.println(c1.getCategory_id()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				//System.out.println(c1.getCategory_name()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				request.setAttribute("category_id", c1.getCategory_id());
				request.setAttribute("category_name",c1.getCategory_name());
				request.setAttribute("parent_id", c1.getParent_id());
				//map.put("category_id",c1.getCategory_id());
				//map.put("parent_id", c1.getParent_id());
				//map.put("category_name", c1.getCategory_name());
				//String jsonStr = JsonUtil.beanToString(map);
				//writer= response.getWriter();
				//writer.write(jsonStr);
				request.getRequestDispatcher("category/editCategory.jsp").forward(request, response);//ת�����ɹ�ҳ��
			}
		} catch (Exception e) {
			e.printStackTrace();
		} /*finally {
			writer.flush();
			writer.close();
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
