package dao;

import pojo.Tag;

import java.util.ArrayList;

public interface TagDao {
	//1.���ӱ�ǩ
	public boolean insertTag(String tag_name);
	//2.ɾ����ǩ
	public boolean deleteTag(int tag_id);
	//3.������еı�ǩ
	public ArrayList<Tag> getAllTag();
	//4.���һ����ǩ
	public Tag getOneTag(int tag_id);
	//5.���±�ǩ
	public boolean updataTag(Tag t);
	//6.������еı�ǩ֮����
	public ArrayList<Tag> getPageTag(int page,int limit);
	//7.ͨ����ǩ���жϸñ�ǩ�Ƿ���ڣ����������ʾ
	public boolean queryIsExist(String tag_name);
}
