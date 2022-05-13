package dao;

import pojo.Adm;
import pojo.ChangePage;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdmDaoImpl implements AdmDao{

	//��ҳ����
	@Override
	public ArrayList<Adm> getPageAdm(int page, int limit) {
		//System.out.println("��ѽ��������ҵķ�ҳ�����𣿣���");
		ArrayList<Adm> adm = new ArrayList<Adm>();
		Connection conn = DBUtil.getConnection();
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		//System.out.println("�ҵ�limit�ǣ�"+limit);
		//System.out.println("�ҵ�page��"+page);
		//System.out.println(startRow);
		String sql = "select * from dai_adm limit "+startRow+","+limit+"";
		// Ԥ����
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				Adm ad = new Adm();
				ad.setAdm_id(rst.getInt(1));
				ad.setAdm_name(rst.getString("adm_name"));
				ad.setAdm_passward(rst.getString("adm_password"));
				adm.add(ad);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return adm;
	}
	//��ѯ���еĹ���Ա
	@Override
	public ArrayList<Adm> getAllAdm() {
		ArrayList<Adm> adm = new ArrayList<Adm>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_adm";
		// Ԥ����
				try {
					PreparedStatement prep = conn.prepareStatement(sql);
					ResultSet rst = prep.executeQuery();
					while (rst.next()) {
						Adm ad = new Adm();
						ad.setAdm_id(rst.getInt(1));
						ad.setAdm_name(rst.getString("adm_name"));
						ad.setAdm_passward(rst.getString("adm_password"));
						adm.add(ad);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						DBUtil.closeConnection(conn);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
		return adm;
	}

	@Override
	public Adm getAdm(String username, String password) {
		//System.out.println("�����Ƿ��¼����������������������");
		Adm a = null;
		Connection conn = DBUtil.getConnection();
		String sql = "select * from dai_adm where adm_name = ? and adm_password = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, username);
			prep.setString(2, password);
			ResultSet rst = prep.executeQuery();
			if(rst.next()) {
				System.out.println("������������servlet�����Ѿ��鵽��Ϣ�ˣ�����");
				a = new Adm();
				a.setAdm_id(rst.getInt("adm_id"));
				a.setAdm_name(rst.getString("adm_name"));
				a.setAdm_passward(rst.getString("adm_password"));
				return a;
			}else {
				//System.out.println(username+","+password);
				//System.out.println("������������servlet����û�в鵽�����Ϣ�������һ�㰡������");
				//System.out.println("a��"+a);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return a;
	}


	//3.��ӹ���Ա ���ﴫ��һ�����󣬻�������ֵ����Ҫ˼��˼��������
	@Override
	public boolean insertAdm(String username,String pwd) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "insert into dai_adm(adm_name,adm_password) values(?,?)";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, username);
			prep.setString(2, pwd);
			prep.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}

	@Override
	public boolean deleteAdm(int adm_id) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ���ɾ����¼
		String sql = "delete from dai_adm where adm_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, adm_id);
			prep.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean updateAdm(Adm a) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "update dai_adm set adm_name = ?,adm_password = ? where adm_id=?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, a.getAdm_name());
			prep.setString(2, a.getAdm_passward());
			prep.setInt(3, a.getAdm_id());
			prep.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean queryIsExist(String username) {
		//System.out.println(username);
		//System.out.println("����register�ص��Ƿ�ִ�У�����");
		Connection conn = DBUtil.getConnection();
		// �����ݿ��в�ѯ��¼
		String sql = "select * from dai_adm where adm_name = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, username);
			ResultSet rst = prep.executeQuery();
			if(rst.next()) {
				return true;
			}else {
				return false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public Adm getOneAdm(int adm_id) {
		Adm a = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "select * from dai_adm where adm_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1,adm_id);
			ResultSet rst = prep.executeQuery();
			a = new Adm();
			if(rst.next()) {
				a.setAdm_id(rst.getInt(1));
				a.setAdm_name(rst.getString("adm_name"));
				a.setAdm_passward(rst.getString("adm_password"));
				return a;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return a;
	}

}
