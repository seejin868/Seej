package connection;
//싱글톤 패턴
//singleTon pattern

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleXeConnection {
	
	private static OracleXeConnection oc = null;
	private static Connection conn = null;
	
	
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
//	final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	/*StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt = null;
	ResultSet rs = null;*/
	
	public OracleXeConnection() {
		// TODO Auto-generated constructor stub
	}
	
	public static OracleXeConnection getInstance() {
		if(oc == null) {
			oc = new OracleXeConnection();
		}
		return oc;
	}
	
	public Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;//getInstans().getConnection()이라는 식을 Connection객체를 리턴 받아 오라클 DB에 접속
	}
	
	public void close() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
