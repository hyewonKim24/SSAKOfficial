package service.order;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

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
	

	// 관리자페이지- 주문내역 조회 관련
	public List<orderVO> orderSearch(String otype, String osearchbar, int start, int end) throws SQLException {
		List<orderVO> ovo = null;
		Connection conn = getConnection();
		try {
			ovo = new orderDAO().orderSearch(conn, otype, osearchbar, start, end);
		} finally {
			close(conn);
		}
		return ovo;

	}

	public int orderSearchCount(String otype, String osearchbar) throws SQLException {
		int cnt = 0;
		Connection conn = getConnection();
		try {
			cnt = new orderDAO().orderSearchCount(conn, otype, osearchbar);
		} finally {
			close(conn);
		}
		return cnt;
	}

	public int getBoardCount() throws SQLException {
		int cnt = 0;
		Connection conn = getConnection();
		try {
			cnt = new orderDAO().getBoardCount(conn);
		} finally {
			close(conn);
		}
		return cnt;
	}

	public List<orderVO> getBoardPage(int start, int end) throws SQLException {
		List<orderVO> pagelist = null;
		Connection conn = getConnection();
		try {
			pagelist = new orderDAO().getBoardPage(conn, start, end);
		} finally {
			
		}
		close(conn);
		return pagelist;
	}

	public List<orderVO> orderDetail(String mid, int ono) throws SQLException {
		List<orderVO> odetail = null;
		Connection conn = getConnection();
		try {
		odetail = new orderDAO().orderDetail(conn, mid, ono);
	}finally {
		close(conn);
	}
		return odetail;
	}

	//내 주문내역 조회
	public List<orderVO> myOrderlist(String mid) throws SQLException {
		List<orderVO> myolist = null;
		Connection conn = getConnection();
		try {
		myolist = new orderDAO().myOrderlist(conn, mid);
	}finally {
		close(conn);
	}
		return myolist;
	}


	//주문하기 관련
	public List<CartListVO> orderList(int[] chks) throws SQLException {
		Connection conn = getConnection();
		List<CartListVO> list = new orderDAO().orderList(conn, chks);
		close(conn);
		return list;
	}
	
	public List<CartListVO> directOrderList(String bisbn, int dno) throws SQLException {
		Connection conn = getConnection();
		List<CartListVO> list = new orderDAO().directOrderList(conn, bisbn, dno);
		close(conn);
		return list;
	}

	public int orderInsert(orderVO vo, int[] dno, String[] bisbn, int[] oamount) throws SQLException {
		Connection conn = getConnection();
		// order insert
		int rs = new orderDAO().orderInsert(conn, vo);
		// neworder insert
		int rs1 = new orderDAO().orderInsert2(conn, dno, bisbn, oamount);
		System.out.println(rs + "행 추가됨");
		System.out.println(rs1 + "행 추가됨");
		close(conn);
		return rs;
	}

}
