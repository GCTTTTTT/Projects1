package dao;

import pojo.Article;

import java.util.ArrayList;

// ����Dao
public interface ArticleDao {
	//1.�������
	public boolean insertArticle(Article a);
	//2.�޸�����
	public boolean updateArticle(Article a);
	//3.ɾ������
	public boolean deleteArticle(int article_id);
	//4.��ȡȫ��������
	public ArrayList<Article> getAllArticle();
	//6.ͨ������id��������
	public ArrayList<Article> getCategoryArticle(int category_id,int page,int limit);
	//6- ͨ������id�������·�������
	public int getAllCategroyArticle(int category_id);	
	//7.��ѯ��ҳ������
	public ArrayList<Article> getPageArticle(int page,int limit);
	//8.����id��ȡһƪ����
	public Article getOneArticle(int article_id);
	//9.��ѯ�ö�����
	public Article getTopArticle(int article_isTop);
	//10.ģ����ѯ �������±���
	public ArrayList<Article> getSearchArticle(String article_title);
	//10.ģ����ѯ �������±���
	public ArrayList<Article> getSearchPageArticle(String article_title,int page,int limit);
	//11.ͨ������ʱ�����id
	public int getArticleId(long article_createtime);
	//12.�����ѯ���� ��ʱ����Ϊ 6
	public ArrayList<Article> getRandomArticle(int limit);
	//13.ͨ��article_id ���ҵ��ܹ��ж��������� ������һ����ͼ����
	public int getCountComment(int article_id);
	//14.��õ�����������ƪ����
	public ArrayList<Article> getHotArticle(int limit);
	//15.����������
	public ArrayList<Article> getNearArticle(int limit);
}
