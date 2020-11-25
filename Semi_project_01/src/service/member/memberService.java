package service.member;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.memberDAO;
import member.model.*;
import oracle.jdbc.OracleConnection.CommitOption;

public class memberService {
	private DataSource ds = null; // Datasource ds는 아파치톰캣(WAS)가 제공하는 DBCP(CB connection pool)이다.
	private Connection conn = null;

	public memberService() {
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
			if (conn != null) {
				conn.close();
				conn = null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean isEmailChk(String memail) throws SQLException {
		Connection conn = ds.getConnection();
		boolean a = new memberDAO().isEmailChk(conn, memail);
		conn.close();
		return a;

	}

	public boolean isIdChk(String mid) throws SQLException {
		Connection conn = ds.getConnection();
		boolean a = new memberDAO().isIdChk(conn, mid);
		conn.close();
		return a;

	}

	public int registerMember(memberVO mvo) throws SQLException {

		Connection conn = ds.getConnection();
		conn.setAutoCommit(false);
		int rs = new memberDAO().registerMember(conn, mvo);
		System.out.println(rs + "행 추가됨.");
		if (rs >= 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		conn.close();
		return rs;
	}

	public memberVO loginMember(String mid, String mpw) throws SQLException {
		Connection conn = ds.getConnection();
		memberVO mvo = new memberDAO().loginMember(conn, mid, mpw);
		conn.close();
		return mvo;

	}

	public memberVO idSearch(String mname, String memail) throws SQLException {
		Connection conn = ds.getConnection();
		memberVO mvo = new memberDAO().idSearch(conn, mname, memail);
		conn.close();
		return mvo;
	}

	public boolean pwSearch(String mid, String memail) throws SQLException {
		Connection conn = ds.getConnection();
		boolean a = new memberDAO().pwSearch(conn, mid, memail);
		conn.close();
		return a;
	}

	public int tmpPwUpdate(String mid, String tempPw) throws SQLException {
		Connection conn = ds.getConnection();
		conn.setAutoCommit(false);
		int rs = new memberDAO().tmpPwUpdate(conn, mid, tempPw);
		if (rs >= 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		conn.close();
		return rs;
	}

	public int myPageUpdate(memberVO mvo) throws SQLException {
		Connection conn = ds.getConnection();
		conn.setAutoCommit(false);
		int rs = new memberDAO().myPageUpdate(conn, mvo);
		if (rs >= 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		conn.close();
		return rs;
	}

	
	//추가
	public List<memberVO> memberSearch(String mtype, String msearchbar, int start, int end) throws SQLException {
		try {
			Connection conn = ds.getConnection();
			List<memberVO> searchlist = null;
			searchlist = new memberDAO().memberSearch(conn, mtype, msearchbar, start, end);
			return searchlist;
		} finally {
			close();
		}
	}

	public int memberSearchCount(String mtype, String msearchbar) throws SQLException {
		try {
			Connection conn = ds.getConnection();
			int cnt = 0;
			cnt = new memberDAO().memberSearchCount(conn, mtype, msearchbar);
			return cnt;
		} finally {
			close();
		}

	}

	public List<memberVO> getBoardPage(int start, int end) throws SQLException {
		try {
			Connection conn = ds.getConnection();
			List<memberVO> pagelist = null;
			pagelist = new memberDAO().getBoardPage(conn, start, end);
			return pagelist;
		} finally {
			close();
		}
	}

	public int getBoardCount() throws SQLException {
		try {
			Connection conn = ds.getConnection();
			int cnt = 0;
			cnt = new memberDAO().getBoardCount(conn);
			return cnt;
		} finally {
			close();
		}
	}

	public memberVO memberDetail(String mid) throws SQLException {
		try {
			Connection conn = ds.getConnection();
			memberVO mvo = null;
			mvo = new memberDAO().memberDetail(conn, mid);
			return mvo;
		} finally {
			close();
		}
	}

	public int memberUpdate(memberVO mvo, String mid) throws SQLException {
		try {
			Connection conn = ds.getConnection();
			int rs = new memberDAO().memberUpdate(conn, mvo, mid);
			System.out.println(rs + "행 수정됨.");
			return rs;
		} finally {
			close();
		}
	}

}
