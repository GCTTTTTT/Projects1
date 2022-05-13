package dao;

import pojo.Adm;

import java.util.ArrayList;

public interface AdmDao {
	//1.��ѯ����Ա,����һ������Ա����  ����login��ͷ�ķ���
	public Adm getAdm(String username,String password);
	//2��ѯ���еĹ���Ա
	public ArrayList<Adm> getAllAdm();
	//3.��ӹ���Ա
	public boolean insertAdm(String username,String pwd);
	//4.����idɾ������Ա
	public boolean deleteAdm(int id);
	//5.�޸Ĺ���Ա��Ϣ
	public boolean updateAdm(Adm a);
	//6.����adm_name��ѯ�Ƿ���ڸ��û�����idΨһ���û���Ψһ
	public boolean queryIsExist(String username);
	//7.����id����ѯһ������Ա
	public Adm getOneAdm(int adm_id);
	//8 ��ҳ��ѯ���еĹ���Ա
	public ArrayList<Adm> getPageAdm(int page,int limit);
	
}
