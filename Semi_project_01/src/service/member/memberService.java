package service.member;

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

import dao.memberDAO;
import member.model.*;
import oracle.jdbc.OracleConnection.CommitOption;

public class memberService {

	public boolean isEmailChk(String memail) throws SQLException {
		Connection conn = getConnection();
		boolean a = new memberDAO().isEmailChk(conn, memail);
		close(conn);
		return a;

	}

	public boolean isIdChk(String mid) throws SQLException {
		Connection conn = getConnection();
		boolean a = new memberDAO().isIdChk(conn, mid);
		close(conn);
		return a;

	}

	public int registerMember(memberVO mvo) throws SQLException {

		Connection conn = getConnection();
//		conn.setAutoCommit(false);
		int rs = new memberDAO().registerMember(conn, mvo);
		System.out.println(rs + "행 추가됨.");
//		if (rs >= 0) {
//			conn.commit();
//		} else {
//			conn.rollback();
//		}
		close(conn);
		return rs;
	}

	public memberVO loginMember(String mid, String mpw) throws SQLException {
		Connection conn = getConnection();
		memberVO mvo = new memberDAO().loginMember(conn, mid, mpw);
		close(conn);
		return mvo;

	}

	public memberVO idSearch(String mname, String memail) throws SQLException {
		Connection conn = getConnection();
		memberVO mvo = new memberDAO().idSearch(conn, mname, memail);
		close(conn);
		return mvo;
	}

	public boolean pwSearch(String mid, String memail) throws SQLException {
		Connection conn = getConnection();
		boolean a = new memberDAO().pwSearch(conn, mid, memail);
		close(conn);
		return a;
	}

	public int tmpPwUpdate(String mid, String tempPw) throws SQLException {
		Connection conn = getConnection();
		conn.setAutoCommit(false);
		int rs = new memberDAO().tmpPwUpdate(conn, mid, tempPw);
		if (rs >= 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		close(conn);
		return rs;
	}

	public int myPageUpdate(memberVO mvo) throws SQLException {
		Connection conn = getConnection();
		conn.setAutoCommit(false);
		int rs = new memberDAO().myPageUpdate(conn, mvo);
		if (rs >= 0) {
			conn.commit();
		} else {
			conn.rollback();
		}
		close(conn);
		return rs;
	}

	
	//추가
	public List<memberVO> memberSearch(String mtype, String msearchbar, int start, int end) throws SQLException {
		Connection conn = getConnection();
		try {
			List<memberVO> searchlist = null;
			searchlist = new memberDAO().memberSearch(conn, mtype, msearchbar, start, end);
			return searchlist;
		} finally {
			close(conn);
		}
	}

	public int memberSearchCount(String mtype, String msearchbar) throws SQLException {
		Connection conn = getConnection();
		try {
			int cnt = 0;
			cnt = new memberDAO().memberSearchCount(conn, mtype, msearchbar);
			return cnt;
		} finally {
			close(conn);
		}

	}

	public List<memberVO> getBoardPage(int start, int end) throws SQLException {
		Connection conn = getConnection();
		try {
			List<memberVO> pagelist = null;
			pagelist = new memberDAO().getBoardPage(conn, start, end);
			return pagelist;
		} finally {
			close(conn);
		}
	}

	public int getBoardCount() throws SQLException {
		Connection conn = getConnection();
		try {
			int cnt = 0;
			cnt = new memberDAO().getBoardCount(conn);
			return cnt;
		} finally {
			close(conn);
		}
	}

	public memberVO memberDetail(String mid) throws SQLException {
		Connection conn = getConnection();
		try {
			
			memberVO mvo = null;
			mvo = new memberDAO().memberDetail(conn, mid);
			return mvo;
		} finally {
			close(conn);
		}
	}

	public int memberUpdate(memberVO mvo, String mid) throws SQLException {
		Connection conn = getConnection();
		try {
			int rs = new memberDAO().memberUpdate(conn, mvo, mid);
			System.out.println(rs + "행 수정됨.");
			return rs;
		} finally {
			close(conn);
		}
	}

}
