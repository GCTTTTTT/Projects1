package dao;

import pojo.Article;
import pojo.ChangePage;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArticleDaoImpl implements ArticleDao {

	@Override
	public boolean insertArticle(Article a) {
		System.out.println("�Ƿ������insertArticle����");
		Connection conn = DBUtil.getConnection();
		String sql = "insert into dai_article(article_content,article_likenum,article_views,article_image,article_title,article_createtime,article_isTop,category_id,article_desc,count_comment)"
				+ " values(?,?,?,?,?,?,?,?,?,0)";
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, a.getArticle_content());
			prep.setInt(2, a.getArticle_likenum());
			prep.setInt(3, a.getArticle_views());
			prep.setString(4, a.getArticle_image());
			prep.setString(5, a.getArticle_title());
			prep.setLong(6, a.getArticle_createtime());
			prep.setInt(7, a.getArticle_isTop());
			prep.setInt(8, a.getCategory_id());
			prep.setString(9, a.getArticle_desc());
			prep.executeUpdate();
			return true;
		} catch (Exception e) {
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

	// ������д�����������ֱ��� article_views �� article_likenum
	@Override
	public boolean updateArticle(Article a) {
		System.out.println("�Ƿ������updateArticle������");
		Connection conn = DBUtil.getConnection();
		String sql = "update dai_article set article_content = ?,article_image = ?,article_title = ?,article_createtime = ?,article_isTop = ?,category_id = ?,article_desc = ?  where article_id=?";
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, a.getArticle_content());
			prep.setString(2, a.getArticle_image());
			prep.setString(3, a.getArticle_title());
			prep.setLong(4, a.getArticle_createtime());
			prep.setInt(5, a.getArticle_isTop());
			prep.setInt(6, a.getCategory_id());
			prep.setString(7, a.getArticle_desc());
			prep.setInt(8, a.getArticle_id());
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
	public boolean deleteArticle(int article_id) {
		System.out.println("�Ƿ������deleteArticle�����أ�����");
		Connection conn = DBUtil.getConnection();
		// �����ݿ���ɾ����¼
		String sql = "delete from dai_article where article_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, article_id);
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

	// 4.������еĲ���
	@Override
	public ArrayList<Article> getAllArticle() {
		System.out.println("�Ƿ������getAllArticle�����أ�����");
		ArrayList<Article> aList = new ArrayList<Article>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_article";
		// Ԥ����
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// System.out.println("����getAllArticle��rst.next()����ķ�������Ȼû�����ң��Ҳ��ţ�");
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public Article getOneArticle(int article_id) {
		Article a = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "select * from dai_article where article_id = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, article_id);
			ResultSet rst = prep.executeQuery();
			a = new Article();
			if (rst.next()) {
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_desc(rst.getString("article_desc"));
				a.setArticle_id(rst.getInt("article_id"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_title(rst.getString("article_title"));
				a.setCategory_id(rst.getInt("category_id"));
				return a;
			}
		} catch (Exception e) {
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

	@Override
	public ArrayList<Article> getPageArticle(int page, int limit) {
		ArrayList<Article> aList = new ArrayList<Article>();
		Connection conn = DBUtil.getConnection();
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();
		// Ԥ����
		try {
			String sql = "select * from dai_article limit " + startRow + "," + limit + "";
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public Article getTopArticle(int article_isTop) {
		Article a = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ����޸ļ�¼
		String sql = "select * from dai_article where article_isTop = ?";
		// Ԥ����
		PreparedStatement prep;
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, article_isTop);
			ResultSet rst = prep.executeQuery();
			a = new Article();
			if (rst.next()) {
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_desc(rst.getString("article_desc"));
				a.setArticle_id(rst.getInt("article_id"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_title(rst.getString("article_title"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				return a;
			}
		} catch (Exception e) {
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

	@Override
	public ArrayList<Article> getSearchArticle(String article_title) {
		// System.out.println("�Ƿ������getSearchArticle�����أ�����");
		ArrayList<Article> aList = new ArrayList<Article>();
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_article where article_title like '%" + article_title + "%'";
		// Ԥ����
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// System.out.println("����getAllArticle��rst.next()����ķ�������Ȼû�����ң��Ҳ��ţ�");
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public int getArticleId(long article_createtime) {
		System.out.println("�Ƿ������getArticleId�ķ���");
		Connection conn = DBUtil.getConnection();
		int id = 0;
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_article where article_createtime = ?";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setLong(1, article_createtime);
			ResultSet rst = prep.executeQuery();
			if (rst.next()) {
				id = rst.getInt(1);
				return id;
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
		return id;

	}

	@Override
	public ArrayList<Article> getSearchPageArticle(String article_title, int page, int limit) {
		ArrayList<Article> aList = new ArrayList<Article>();
		Connection conn = DBUtil.getConnection();
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_article where article_title like '%" + article_title + "%' limit " + startRow
				+ "," + limit + "";
		// Ԥ����
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// System.out.println("����getAllArticle��rst.next()����ķ�������Ȼû�����ң��Ҳ��ţ�");
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public ArrayList<Article> getCategoryArticle(int category_id, int page, int limit) {
		ArrayList<Article> aList = null;
		Connection conn = DBUtil.getConnection();
		ChangePage cp = new ChangePage();
		cp.setLimit(limit);
		cp.setPage(page);
		int startRow = cp.getStartRow();
		// �����ݿ�����Ӽ�¼
		String sql = "select * from dai_article where category_id = ? limit ?,?";
		// Ԥ����
		try {
			System.out.println("category_id:"+category_id+",page"+page+",limit"+limit);
			aList = new ArrayList<Article>();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, category_id);
			prep.setInt(2, startRow);
			prep.setInt(3, limit);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public int getAllCategroyArticle(int category_id) {
		int count = 0;
		Connection conn = DBUtil.getConnection();
		String sql = "select * from dai_article where category_id = ? ";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, category_id);
			ResultSet rst = prep.executeQuery();
			rst.last();// ������ڱ�β
			count = rst.getRow();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	@Override
	public ArrayList<Article> getRandomArticle(int limit) {
		ArrayList<Article> aList = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "SELECT * FROM dai_article " + 
				"WHERE article_id >= (SELECT floor(RAND() * (SELECT MAX(article_id) FROM dai_article))) " + 
				"ORDER BY article_id LIMIT ?; ";
		// Ԥ����
		try {
			aList = new ArrayList<Article>();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, limit);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public int getCountComment(int article_id) {
		int count = 0;
		Connection conn = DBUtil.getConnection();
		String sql = "select comment_count from count_comment where article_id = ?";
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, article_id);
			ResultSet rst = prep.executeQuery();
			if(rst!=null) {
				count = rst.getInt("comment_count");
				return count;
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
		return count;
	}

	@Override
	public ArrayList<Article> getHotArticle(int limit) {
		ArrayList<Article> aList = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "SELECT * FROM dai_article ORDER BY article_likenum desc limit ?";
		// Ԥ����
		try {
			aList = new ArrayList<Article>();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, limit);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

	@Override
	public ArrayList<Article> getNearArticle(int limit) {
		ArrayList<Article> aList = null;
		Connection conn = DBUtil.getConnection();
		// �����ݿ�����Ӽ�¼
		String sql = "SELECT * FROM dai_article ORDER BY article_createtime desc limit ?";
		// Ԥ����
		try {
			aList = new ArrayList<Article>();
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, limit);
			ResultSet rst = prep.executeQuery();
			while (rst.next()) {
				// һ���оŸ�ֵ
				Article a = new Article();
				a.setArticle_id(rst.getInt(1));
				a.setArticle_content(rst.getString("article_content"));
				a.setArticle_createtime(rst.getLong("article_createtime"));
				a.setArticle_title(rst.getString("article_title"));
				a.setArticle_image(rst.getString("article_image"));
				a.setArticle_isTop(rst.getInt("article_isTop"));
				a.setArticle_views(rst.getInt("article_views"));
				a.setArticle_likenum(rst.getInt("article_likenum"));
				a.setCategory_id(rst.getInt("category_id"));
				a.setArticle_desc(rst.getString("article_desc"));
				aList.add(a);
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
		return aList;
	}

}
