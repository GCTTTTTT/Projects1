package dao;

import pojo.Comment2;

import java.util.ArrayList;

public interface Comment2Dao {
	// 1.��������
	public ArrayList<Comment2> getAllComment(int article_id);

	// 2.�������� �з�ҳЧ��
	public ArrayList<Comment2> getPageComment(int article_id,int page, int limit);

	// 3.ɾ������
	public boolean delComment(int comment_id);

	// 4.��������
	public boolean insertComment(Comment2 c);
	
	// 5.�������� ����������������
	public int getSearchComment2(String comment_content);
	
	//6.�������� ���������������� ��ҳ
	public ArrayList<Comment2> getSearchComment2(String comment_content,int page,int limit);
}
