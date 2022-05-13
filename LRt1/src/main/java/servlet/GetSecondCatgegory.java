package servlet;

import dao.CategoryDao;
import dao.CategoryDaoImpl;
import pojo.Category;
import util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class GetSecondCatgegory
 */
@WebServlet("/getSecondCatgegory")
public class GetSecondCatgegory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSecondCatgegory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = null;
		response.setContentType("text/html;charset=utf-8");
		try {
			int parent_id = Integer.parseInt(request.getParameter("parent_id"));
			CategoryDao c = new CategoryDaoImpl();
			ArrayList<Category> aList = c.getSecondCategory(parent_id);
			//ͨ��id���ҵ��������
			Category cat = c.getOneCategory(parent_id);
			String parent_name = cat.getCategory_name();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("code", 0);
			map.put("msg", "");
			map.put("count", aList.size());
			map.put("data", aList);
			map.put("parent_name", parent_name);
			String jsonStr = JsonUtil.beanToString(map);
			//System.out.println(jsonStr);
			writer= response.getWriter();
			writer.write(jsonStr);
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
