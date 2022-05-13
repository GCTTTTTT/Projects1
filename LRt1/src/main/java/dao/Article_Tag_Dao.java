package dao;

import pojo.Article;
import pojo.Article_Tag;

import java.util.ArrayList;

public interface Article_Tag_Dao {
	//1.�������ݵ����ݿ�
	public boolean insertArticle_Tag(int article_id,int tag_id); 
	//2.�޸����ݵ����ݿ�
	public boolean updateArticle_Tag(int article_id,int tag_id);
	//3.ɾ�����ݵ����ݿ�
	public boolean deleteArticle_Tag(int article_id,int tag_id);
	//4.ͨ��article_id��ѯtag_id
	public ArrayList<Article_Tag> searchArticle_Tag(int article_id);
	//5.ͨ��tag_id��ѯarticle_id ��ҳ
	public ArrayList<Article> searchTag_Article(int tag_id,int page,int limit);
	//6.ͨ��tag_id��ѯarticle_id ����
	public int searchAllTag_Article(int tag_id);
}
