package servlet;

import dao.FriendDao;
import dao.FriendDaoImpl;
import pojo.Friend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SelectFriend
 */
@WebServlet("/selectFriend")
public class SelectFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFriend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//System.out.println("�Ƿ������selectFriend�أ�");
			int friend_id = Integer.parseInt(request.getParameter("friend_id"));
			FriendDao fd = new FriendDaoImpl();
			Friend f = fd.getOneFriend(friend_id);
			if(f!=null) {
				request.setAttribute("friend_id", f.getFriend_id());
				request.setAttribute("friend_name",f.getFriend_name());
				request.setAttribute("friend_url", f.getFriend_url());
				request.getRequestDispatcher("friend/editFriend.jsp").forward(request, response);//ת�����ɹ�ҳ��
			}
		} catch (Exception e) {
			e.printStackTrace();
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
