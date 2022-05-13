package servlet;

import dao.CommentDao;
import dao.CommentDaoImpl;
import pojo.Comment;
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
 * Servlet implementation class FindComment
 */
@WebServlet("/findComment")
public class FindComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("�����Ƿ������findComment��servlet����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		PrintWriter writer = null;
		int limit = 0;
		int page = 0;
		try {
			limit = Integer.parseInt(request.getParameter("limit"));
			page = Integer.parseInt(request.getParameter("page"));
			// ���ղ���
			String comment_content = request.getParameter("comment_content");
			int comment_type = Integer.parseInt(request.getParameter("comment_type"));
			System.out.println("comment_content�ǣ�"+comment_content+"��comment_type��"+comment_type);
			CommentDao cd = new CommentDaoImpl();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("code", 0);
			map.put("msg", "");
			//��ʾֻ�����ͽ�����������������������
			if(comment_type!=0&&comment_content=="") {
				System.out.println("����1����������������������");
				ArrayList<Comment> aListType = cd.getTypeComment(comment_type);
				ArrayList<Comment> aListPageType = cd.getPageTypeComment(comment_type, page, limit);
				System.out.println(aListType.size());
				System.out.println(aListPageType.size());
				map.put("count", aListType.size());
				map.put("data", aListPageType);
			}
			//��ʾֻ���������ݽ�������������������
			else if(comment_type==0&&comment_content!="") {
				System.out.println("����2����������������������");
				ArrayList<Comment> aListComment = cd.getContentComment(comment_content);
				ArrayList<Comment> aListPageComment = cd.getPageContentComment(comment_content, page, limit);
				map.put("count", aListComment.size());
				map.put("data", aListPageComment);
				System.out.println(aListComment.size()+","+aListPageComment.size());
			}
			//��ʾ�������������н�������
			else if(comment_type!=0&&comment_content!=""){
				System.out.println("����3����������������������");
				ArrayList<Comment> aListAll =cd.getSpecificComment(comment_type, comment_content);
				ArrayList<Comment> aListPageAll =  cd.getPageSpecificComment(comment_type, comment_content, page, limit);
				map.put("count", aListAll.size());
				map.put("data", aListPageAll);
				System.out.println(aListAll.size()+","+aListPageAll.size());
			}
			String jsonStr = JsonUtil.beanToString(map);
			writer= response.getWriter();
			writer.write(jsonStr);	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}
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
