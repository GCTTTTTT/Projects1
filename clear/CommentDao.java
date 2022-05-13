package dao;

import pojo.Comment;

import java.util.ArrayList;

public interface CommentDao {
	//1.��������
	public ArrayList<Comment> getAllComment();
	//2.�������� �з�ҳЧ��
	public ArrayList<Comment> getPageComment(int page,int limit);
	//3.ɾ������
	public boolean delComment(int comment_id);
	//4.��������
	public boolean insertComment(Comment c);
	//5.�������ͺ�������������
	// 5.1 �������ͱ�������
	public ArrayList<Comment> getPageTypeComment(int comment_type,int page,int limit);
	public ArrayList<Comment> getTypeComment(int comment_type);
	// 5.2 �������ݱ�������
	public ArrayList<Comment> getPageContentComment(String comment_content,int page,int limit);
	public ArrayList<Comment> getContentComment(String comment_content);
	// 5.3 �������ݺ����ͱ�������
	public ArrayList<Comment> getPageSpecificComment(int comment_type,String comment_content,int page,int limit);
	public ArrayList<Comment> getSpecificComment(int comment_type,String comment_content);
	

}
