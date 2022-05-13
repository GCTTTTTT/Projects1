package util;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
	private static String driverClass;
	private static String url;
	private static String user;
	private static String pwd;
	
	//static block��̬��
	static{
		//����properties���ʵ��
		Properties prop = new Properties();
		//ת�����ļ���
//		InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("util/config.properties");
		InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("config.properties");
		
		try {
			prop.load(is);
			driverClass = prop.getProperty("driverClass").trim();
			url = prop.getProperty("url").trim();
			user = prop.getProperty("user").trim();
			pwd = prop.getProperty("pwd").trim();
			Class.forName(driverClass);
			
			//��ǰ���λ��
			System.out.println(DBUtil.class.getResource(""));
			//��ǰ��ĸ�Ŀ¼��λ��
			System.out.println(DBUtil.class.getClassLoader().getResource(""));
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static Connection getConnection(){
		// ���ݿ������
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user,pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeConnection(Connection conn) throws SQLException {
		conn.close();
	}
	
}