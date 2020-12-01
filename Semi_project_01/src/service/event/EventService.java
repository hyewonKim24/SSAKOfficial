package service.event;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

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
		
	public List<EventVO> eventList(int start, int end) throws SQLException{
		Connection conn = getConnection();
		List<EventVO> list = new EventDAO().eventList(conn, start, end);
		close(conn);
		return list;
	}
	
	public int eventWrite(EventVO vo) throws SQLException {
		Connection conn = getConnection();
		int rs = new EventDAO().eventWrite(conn, vo);
		System.out.println(rs+"행 추가됨");
		close(conn);
		return rs;
	}
	
	public int eventUpdate(String econtent, int eno) throws SQLException {
		Connection conn=getConnection();
		int rs = new EventDAO().eventUpdate(conn, econtent, eno);
		System.out.println(rs+"행 업데이트됨");
		close(conn);
		return rs;
	}
	
	public int eventDelete(int eno) throws SQLException {
		Connection conn= getConnection();
		int rs = new EventDAO().eventDelete(conn, eno);
		System.out.println(rs+"행 삭제됨");
		close(conn);
		return rs;
	}
	
	public int eventCount() throws SQLException {
		Connection conn= getConnection();
		int rs = new EventDAO().eventCount(conn);
		close(conn);
		return rs;
	}
	
}
