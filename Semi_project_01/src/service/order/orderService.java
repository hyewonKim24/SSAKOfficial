package service.order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cart.model.CartListVO;
import dao.memberDAO;
import dao.orderDAO;
import member.model.*;
import order.model.*;

public class orderService {
	private DataSource ds = null;
	private Connection conn = null;

	public orderService() {
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

	// 관리자페이지- 주문내역 조회 관련
	public List<orderVO> orderSearch(String otype, String osearchbar, int start, int end) throws SQLException {
		List<orderVO> ovo = null;
		try {
			Connection conn = ds.getConnection();
			ovo = new orderDAO().orderSearch(conn, otype, osearchbar, start, end);
		} finally {
			close();
		}
		return ovo;

	}

	public int orderSearchCount(String otype, String osearchbar) throws SQLException {
		int cnt = 0;
		try {
			Connection conn = ds.getConnection();
			cnt = new orderDAO().orderSearchCount(conn, otype, osearchbar);
		} finally {
			close();
		}
		return cnt;
	}

	public int getBoardCount() throws SQLException {
		int cnt = 0;
		try {
			Connection conn = ds.getConnection();
			cnt = new orderDAO().getBoardCount(conn);
		} finally {
			close();
		}
		return cnt;
	}

	public List<orderVO> getBoardPage(int start, int end) throws SQLException {
		List<orderVO> pagelist = null;
		try {
			Connection conn = ds.getConnection();
			pagelist = new orderDAO().getBoardPage(conn, start, end);
		} finally {
			
		}
		close();
		return pagelist;
	}

	public List<orderVO> orderDetail(String mid, int ono) throws SQLException {
		List<orderVO> odetail = null;
		try {
		Connection conn = ds.getConnection();
		odetail = new orderDAO().orderDetail(conn, mid, ono);
	}finally {
		close();
	}
		return odetail;
	}

	//내 주문내역 조회
	public List<orderVO> myOrderlist(String mid) throws SQLException {
		List<orderVO> myolist = null;
		try {
		Connection conn = ds.getConnection();
		myolist = new orderDAO().myOrderlist(conn, mid);
	}finally {
		close();
	}
		return myolist;
	}


	//주문하기 관련
	public List<CartListVO> orderList(int[] chks) throws SQLException {
		Connection conn = ds.getConnection();
		List<CartListVO> list = new orderDAO().orderList(conn, chks);
		close();
		return list;
	}
	
	public List<CartListVO> directOrderList(String bisbn, int dno) throws SQLException {
		Connection conn = ds.getConnection();
		List<CartListVO> list = new orderDAO().directOrderList(conn, bisbn, dno);
		close();
		return list;
	}

	public int orderInsert(orderVO vo, int[] dno, String[] bisbn, int[] oamount) throws SQLException {
		Connection conn = ds.getConnection();
		// order insert
		int rs = new orderDAO().orderInsert(conn, vo);
		// neworder insert
		int rs1 = new orderDAO().orderInsert2(conn, dno, bisbn, oamount);
		System.out.println(rs + "행 추가됨");
		System.out.println(rs1 + "행 추가됨");
		close();
		return rs;
	}

}
