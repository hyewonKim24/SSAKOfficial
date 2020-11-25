package service.withdraw;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import Withdraw.model.*;
import dao.withdrawDAO;

public class withdrawService {
	private DataSource ds=null;
	private Connection conn=null;
	
	public withdrawService() {
		Context initContext1;
		try {
			initContext1 = new InitialContext();
			Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
			ds = (DataSource) envContext1.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	private void close() {
		
		try {
			if(conn!=null) {
			conn.close();
			conn=null;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void commit() {
		try {
			if (conn != null) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void rollback() {
		try {
			if (conn != null) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<WithdrawVO> wreqSearch(String wtype, String wsearchbar, int start, int end)  throws SQLException {
		Connection conn = ds.getConnection();
		List<WithdrawVO> wlist = null;
		try {
			wlist = new withdrawDAO().wreqSearch(conn, wtype, wsearchbar, start, end);
		} finally {
			close();
		}
		return wlist;

	}
	
	public int wreqSearchCount(String wtype, String wsearchbar) throws SQLException {
		Connection conn = ds.getConnection();
		int cnt = 0;
		try {
			cnt = new withdrawDAO().wreqSearchCount(conn, wtype, wsearchbar);
			conn.setAutoCommit(false);
			if(cnt > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int getBoardCount() throws SQLException {
		Connection conn = ds.getConnection();
		int cnt = 0;
		try {
			cnt = new withdrawDAO().getBoardCount(conn);
			conn.setAutoCommit(false);
			if (cnt > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return cnt;
	}

	public List<WithdrawVO> getBoardPage(int start, int end) throws SQLException {
		Connection conn = ds.getConnection();
		List<WithdrawVO> pagelist = null;
		try {
			pagelist = new withdrawDAO().getBoardPage(conn, start, end);
		} finally {
			close();
		}
		return pagelist;
	}

	public int wrerInsert(WithdrawVO wvo) throws SQLException {
		Connection conn = ds.getConnection();
		int result = 0;
		try {
			result = new withdrawDAO().wrerInsert(conn, wvo);
			System.out.println(result + "행 추가됨.");
			conn.setAutoCommit(false);
			if (result > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return result;
	}


	public WithdrawVO wreqDetail(String mid) throws SQLException {
		Connection conn = ds.getConnection();
		WithdrawVO wdetail = null;
		try {
			wdetail = new withdrawDAO().wreqDetail(conn, mid);
		} finally {
			close();
		}
		return wdetail;
	}

	public int wreqAccept(String mid) throws SQLException {
		Connection conn = ds.getConnection();
		int result = 0;
		try {
			result = new withdrawDAO().wreqAccept(conn, mid);
			conn.setAutoCommit(false);
			if(result > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return result;
	}
}
