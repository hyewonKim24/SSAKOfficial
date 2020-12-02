package service.withdraw;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import Withdraw.model.*;
import dao.withdrawDAO;

public class withdrawService {

	public List<WithdrawVO> wreqSearch(String wtype, String wsearchbar, int start, int end)  throws SQLException {
		Connection conn = getConnection();
		List<WithdrawVO> wlist = null;
		try {
			wlist = new withdrawDAO().wreqSearch(conn, wtype, wsearchbar, start, end);
		} finally {
			close(conn);
		}
		return wlist;

	}
	
	public int wreqSearchCount(String wtype, String wsearchbar) throws SQLException {
		Connection conn = getConnection();
		int cnt = 0;
		try {
			cnt = new withdrawDAO().wreqSearchCount(conn, wtype, wsearchbar);
			conn.setAutoCommit(false);
			if(cnt > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return cnt;
	}
	
	public int getBoardCount() throws SQLException {
		Connection conn = getConnection();
		int cnt = 0;
		try {
			cnt = new withdrawDAO().getBoardCount(conn);
			conn.setAutoCommit(false);
			if (cnt > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return cnt;
	}

	public List<WithdrawVO> getBoardPage(int start, int end) throws SQLException {
		Connection conn = getConnection();
		List<WithdrawVO> pagelist = null;
		try {
			pagelist = new withdrawDAO().getBoardPage(conn, start, end);
		} finally {
			close(conn);
		}
		return pagelist;
	}

	public int wrerInsert(WithdrawVO wvo) throws SQLException {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = new withdrawDAO().wrerInsert(conn, wvo);
			System.out.println(result + "행 추가됨.");
			conn.setAutoCommit(false);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}


	public WithdrawVO wreqDetail(String mid) throws SQLException {
		Connection conn = getConnection();
		WithdrawVO wdetail = null;
		try {
			wdetail = new withdrawDAO().wreqDetail(conn, mid);
		} finally {
			close(conn);
		}
		return wdetail;
	}

	public int wreqAccept(String mid) throws SQLException {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = new withdrawDAO().wreqAccept(conn, mid);
			conn.setAutoCommit(false);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}
}
