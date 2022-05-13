package dao;

import pojo.Category;
import pojo.ChangePage;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDaoImpl implements CategoryDao {

	//1.���ӷ���
	@Override
	public boolean insertCategory(int parent_id,String category_name) {
		//System.out.println("1.���������������Ŷ");
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "insert into dai_category(parent_id,category_name) values(?,?)";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, parent_id);
			prep.setString(2, category_name);
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

	//2.��ȡ���еķ���
	@Override
	public ArrayList<Category> getAllCategory() {
		ArrayList<Category> c = new ArrayList<Category>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_category";
		// Ԥ����
				try {
					PreparedStatement prep = conn.prepareStatement(sql);
					ResultSet rst = prep.executeQuery();
					while (rst.next()) {
						Category c1 = new Category();
						c1.setCategory_id(rst.getInt(1));
						c1.setCategory_name(rst.getString("category_name"));
						c1.setParent_id(rst.getInt("parent_Id"));
						c.add(c1);
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
		return c;
	}
	
	//3.����id�����ݿ��в�ѯ����
	@Override
	public Category getOneCategory(int category_id) {
		//System.out.println("�ֵ���������Ŀ�Ĳ��Ի�����������");
		Category c = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "select * from dai_category where category_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1,category_id);
			ResultSet rst = prep.executeQuery();
			c = new Category();
			if(rst.next()) {
				c.setCategory_id(rst.getInt("category_id"));
				c.setCategory_name(rst.getString("category_name"));
				c.setParent_id(rst.getInt("parent_id"));
				return c;
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
		return c;
	}
	//4.�޸ķ���
	@Override
	public boolean update(Category category) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "update dai_category set category_name = ?,parent_id = ? where category_id=?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1,category.getCategory_name());
			prep.setInt(2, category.getParent_id());
			prep.setInt(3, category.getCategory_id());
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
	//5.ɾ������
	@Override
	public boolean delete(int category_id) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ���ɾ����¼
		String sql = "delete from dai_category where category_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, category_id);
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

	//���һ��Ŀ¼
	@Override
	public ArrayList<Category> getFirstCategory() {
		System.out.println("���һ��Ŀ¼");
		ArrayList<Category> c = new ArrayList<Category>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_category where parent_id = 0";
		// Ԥ����
				try {
					PreparedStatement prep = conn.prepareStatement(sql);
					ResultSet rst = prep.executeQuery();
					while (rst.next()) {
						Category c1 = new Category();
						c1.setCategory_id(rst.getInt(1));
						c1.setCategory_name(rst.getString("category_name"));
						c1.setParent_id(rst.getInt("parent_Id"));
						c.add(c1);
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
				System.out.println("һ��Ŀ¼����"+c.size()+"������");
		return c;
	}

	//��ö���Ŀ¼
	@Override
	public ArrayList<Category> getSecondCategory(int parent_id) {
		System.out.println("��ö���Ŀ¼");
		ArrayList<Category> c = new ArrayList<Category>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_category where parent_id = ?";
		// Ԥ����
				try {
					PreparedStatement prep = conn.prepareStatement(sql);
					prep.setInt(1, parent_id);
					ResultSet rst = prep.executeQuery();
					while (rst.next()) {
						Category c1 = new Category();
						c1.setCategory_id(rst.getInt(1));
						c1.setCategory_name(rst.getString("category_name"));
						c1.setParent_id(rst.getInt("parent_Id"));
						c.add(c1);
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
		return c;
	}

	@Override
	public ArrayList<Category> getPageCategory(int page, int limit) {
		ArrayList<Category> c = new ArrayList<Category>();
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql =  "select * from dai_category limit "+startRow+","+limit+"";
		// Ԥ����
				try {
					PreparedStatement prep = conn.prepareStatement(sql);
					ResultSet rst = prep.executeQuery();
					while (rst.next()) {
						Category c1 = new Category();
						c1.setCategory_id(rst.getInt(1));
						c1.setCategory_name(rst.getString("category_name"));
						c1.setParent_id(rst.getInt("parent_Id"));
						c.add(c1);
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
		return c;
	}

	@Override
	public int getParentCategory(int category_id) {
		Category c = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "select * from dai_category where category_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1,category_id);
			ResultSet rst = prep.executeQuery();
			c = new Category();
			if(rst.next()) {
				c.setCategory_id(rst.getInt("category_id"));
				c.setCategory_name(rst.getString("category_name"));
				c.setParent_id(rst.getInt("parent_id"));
				return c.getParent_id();
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
		return c.getParent_id();
	}

}
