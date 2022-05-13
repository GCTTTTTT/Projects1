package dao;

import pojo.ChangePage;
import pojo.Comment;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDaoImpl implements CommentDao{

	@Override
	public ArrayList<Comment> getAllComment() {
		//System.out.println("�Ƿ������getAllComment�ķ���");
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql = "select * from dai_comment";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {			
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getPageComment(int page, int limit) {
		//System.out.println("�Ƿ������getPageComment�ķ���");
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment limit "+startRow+","+limit+"";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public boolean delComment(int comment_id) {
		//System.out.println("�Ƿ������delComemnt����");
		Connection conn = DBUtil.getConnection();
		String sql = "delete from dai_comment where comment_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, comment_id);
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
	public boolean insertComment(Comment c) {
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "insert into dai_comment(comment_name,parent_id,comment_content,comment_likenum,comment_createtime,comment_type,comment_email) values(?,?,?,?,?,?,?)";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, c.getComment_name());
			prep.setInt(2, c.getParent_id());
			prep.setString(3, c.getComment_content());
			prep.setInt(4, c.getComment_likenum());
			prep.setLong(5, c.getComment_createtime());
			prep.setInt(6, c.getComment_type());
			prep.setString(7, c.getComment_email());
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
	public ArrayList<Comment> getPageTypeComment(int comment_type,int page,int limit) {
		System.out.println("�����Ƿ������getPageTypeComment����");
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_type = ? order by comment_createtime desc limit "+startRow+","+limit+"";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1,comment_type);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getPageContentComment(String comment_content,int page,int limit) {
		//System.out.println("�����Ƿ������getPageContentComment����");
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_content like '%"+comment_content+"%' limit "+startRow+","+limit+"";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getPageSpecificComment(int comment_type, String comment_content,int page,int limit) {
		System.out.println("�����Ƿ������getPageSpecificComment����");
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();	
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_type = ? and comment_content like '%"+comment_content+"%' limit "+startRow+","+limit+"";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, comment_type);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getTypeComment(int comment_type) {
		System.out.println("�����Ƿ������getTypeComment����");
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_type = ?";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1,comment_type);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getContentComment(String comment_content) {
		//System.out.println("�����Ƿ������getContentComment����");
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_content like '%"+comment_content+"%' ";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

	@Override
	public ArrayList<Comment> getSpecificComment(int comment_type, String comment_content) {
		System.out.println("�����Ƿ������getSpecificComment����");	
		ArrayList<Comment> cList = null;                                                                                                   
		Connection conn = DBUtil.getConnection();
		String sql =  "select * from dai_comment where comment_type = ? and comment_content like '%"+comment_content+"%' ";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, comment_type);
			ResultSet rst = prep.executeQuery();
			cList = new ArrayList<Comment>(); 
			while (rst.next()) {
				Comment c = new Comment();
				c.setComment_content(rst.getString("comment_content"));
				c.setComment_createtime(rst.getLong("comment_createtime"));
				c.setComment_id(rst.getInt(1));
				c.setComment_likenum(rst.getInt("comment_likenum"));
				c.setComment_name(rst.getString("comment_name"));
				c.setComment_type(rst.getInt("comment_type"));
				c.setParent_id(rst.getInt("parent_id"));
				c.setComment_email(rst.getString("comment_email"));
				cList.add(c);
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
		return cList;
	}

}
