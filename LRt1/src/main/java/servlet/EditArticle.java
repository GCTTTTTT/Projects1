package servlet;

import dao.ArticleDao;
import dao.ArticleDaoImpl;
import dao.Article_Tag_Dao;
import dao.Article_Tag_DaoImpl;
import pojo.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class EditArticle
 */
@WebServlet("/editArticle")
public class EditArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("�����Ƿ������editArticle��Servlet����");
		String result = "false";
		PrintWriter writer = null;
		response.setContentType("text/html;charset=utf-8");
		try {	
			ArticleDao ad = new ArticleDaoImpl();
			//��ȡ��ǰʱ���ʱ���
			Long article_createtime = System.currentTimeMillis();
			String article_title = request.getParameter("article_title");
			int article_id = Integer.parseInt(request.getParameter("article_id"));
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			int article_isTop = Integer.parseInt(request.getParameter("article_isTop"));
			String article_image = request.getParameter("article_image");
			String article_desc = request.getParameter("article_desc");
			String article_content = request.getParameter("article_content");
			int article_likenum = 0;
			int article_views = 0;
			//��ǩ
			int tag_id1 = Integer.parseInt(request.getParameter("tag_id1"));
			int tag_id2 = Integer.parseInt(request.getParameter("tag_id2"));
			int tag_id3 = Integer.parseInt(request.getParameter("tag_id3"));
			int tag_1 = Integer.parseInt(request.getParameter("tag_1"));
			int tag_2 = Integer.parseInt(request.getParameter("tag_2"));
			int tag_3 = Integer.parseInt(request.getParameter("tag_3"));
			Article a = new Article();
			a.setArticle_id(article_id);
			a.setArticle_content(article_content);
			a.setArticle_createtime(article_createtime);
			a.setArticle_desc(article_desc);
			a.setArticle_isTop(article_isTop);
			a.setArticle_image(article_image);
			a.setArticle_likenum(article_likenum);
			a.setCategory_id(category_id);
			a.setArticle_views(article_views);
			a.setArticle_title(article_title);
			boolean flag = ad.updateArticle(a);
			if(flag) {
				result="true";
				//��ִ��һ��dao���� ͨ��createtime��ѯid ����idֵ
				//�ٽ�articleIdд���ͱ�ǩ���������ݿ���
				Article_Tag_Dao atd = new Article_Tag_DaoImpl();
				//�����һ����ǩ �����˱仯
				if(tag_1!=tag_id1) {
					boolean flag2 = atd.updateArticle_Tag(article_id, tag_id1);
					System.out.println("��һ����ǩ�Ƿ�������ݿ�ɹ�������"+flag2);
				}
				
				if(tag_id2!=0&&tag_2!=0) {
					boolean flag3 = atd.updateArticle_Tag(article_id, tag_id2);
					System.out.println("�ڶ�����ǩ�Ƿ�������ݿ�ɹ�������"+flag3);
				}else if(tag_id2!=0&&tag_2==0) {
					boolean flag3 = atd.insertArticle_Tag(article_id, tag_id2);
					System.out.println("�ڶ�����ǩ�Ƿ�������ݿ�ɹ�������"+flag3);
				}else if(tag_id2==0&&tag_2!=0) {
					boolean flag3 = atd.deleteArticle_Tag(article_id, tag_2);
					System.out.println("�ڶ�����ǩ�Ƿ�������ݿ�ɹ�������"+flag3);
				}
				if(tag_id3!=0&&tag_3!=0) {
					boolean flag4 = atd.updateArticle_Tag(article_id, tag_id3);
					System.out.println("��������ǩ�Ƿ�������ݿ�ɹ�������"+flag4);
				}else if(tag_id3!=0&&tag_3==0){
					boolean flag4 = atd.insertArticle_Tag(article_id, tag_id3);
					System.out.println("��������ǩ�Ƿ�������ݿ�ɹ�������"+flag4);
				}else if(tag_id3==0&&tag_3!=0) {
					boolean flag4 = atd.deleteArticle_Tag(article_id, tag_3);
					System.out.println("��������ǩ�Ƿ�������ݿ�ɹ�������"+flag4);
				}
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
