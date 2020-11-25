package service.event;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.EventDAO;
import event.model.EventVO;

public class EventService {
	private DataSource ds=null;
	private Connection conn=null;
	
	public EventService() {
		Context initContext1;
		try {
			initContext1 = new InitialContext();
			Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
			ds = (DataSource) envContext1.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void close(Connection con) {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<EventVO> eventList(int start, int end) throws SQLException{
		Connection conn = ds.getConnection();
		List list = new EventDAO().eventList(conn, start, end);
		conn.close();
		return list;
	}
	
	public int eventWrite(EventVO vo) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new EventDAO().eventWrite(conn, vo);
		System.out.println(rs+"행 추가됨");
		conn.close();
		return rs;
	}
	
	public int eventUpdate(String econtent, int eno) throws SQLException {
		Connection conn=ds.getConnection();
		int rs = new EventDAO().eventUpdate(conn, econtent, eno);
		System.out.println(rs+"행 업데이트됨");
		conn.close();
		return rs;
	}
	
	public int eventDelete(int eno) throws SQLException {
		Connection conn=ds.getConnection();
		int rs = new EventDAO().eventDelete(conn, eno);
		System.out.println(rs+"행 삭제됨");
		conn.close();
		return rs;
	}
	
	public int eventCount() throws SQLException {
		Connection conn=ds.getConnection();
		int rs = new EventDAO().eventCount(conn);
		conn.close();
		return rs;
	}
	
}
