package common.filter;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCTemplete {
	private static DataSource ds = null;
	private static Connection conn = null;
	
	//커넥션풀  + 싱글톤 한꺼번에 하는 효과
	public static Connection getConnection() {
		try {
		Context initContext1 = new InitialContext();
		Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
		ds = (DataSource)envContext1.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		if(conn == null) {
			System.out.println("******연결실패*****");
		} else {}
			System.out.println("******연결성공*****");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	} 
	public static void close(Statement stmt) {
		try {
			if(stmt != null ) {
				stmt.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static void close(Connection conn) {
		try {
			if(conn != null ) {
				conn.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		try {
			if (conn != null) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if (conn != null) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
