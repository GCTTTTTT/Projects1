package dao;

import pojo.Category;

import java.util.ArrayList;

public interface CategoryDao {
	//1.���ӷ���
	public boolean insertCategory(int parent_id,String category_name);
	//2.��ȡ���еķ���
	public ArrayList<Category> getAllCategory();
	//3.����id�����ݿ��в�ѯ����
	public  Category getOneCategory(int category_id);
	//4.�޸ķ���
	public boolean update(Category category);
	//5.ɾ������
	public boolean delete(int category_id);
	//6.���һ��Ŀ¼
	public ArrayList<Category> getFirstCategory();
	//7.��ö���Ŀ¼
	public ArrayList<Category> getSecondCategory(int parent_id);
	//8.��ȡ��ҳ����
	public ArrayList<Category> getPageCategory(int page,int limit);
	//9.ͨ���ӷ���鸸����
	public int getParentCategory(int category_id);
}
