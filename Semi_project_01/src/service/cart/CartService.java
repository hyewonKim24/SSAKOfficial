package service.cart;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cart.model.CartListVO;
import cart.model.CartVO;
import dao.CartDAO;


public class CartService {
	private DataSource ds = null;
	private Connection conn = null;

	public CartService() {
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

	public List<CartListVO> cartList(String mid) throws SQLException {
		Connection conn = ds.getConnection();
		List list = new CartDAO().cartList(conn, mid);
		conn.close();
		return list;
	}

	public int cartInserts(String mid, Map<String, Integer> insertmap) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartInserts(conn, mid, insertmap);
		System.out.println(rs + "행 추가됨");
		conn.close();
		return rs;
	}

	public int cartInsert(CartVO vo) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartInsert(conn, vo);
		System.out.println(rs + "행 추가됨");
		conn.close();
		return rs;
	}

	public int cartDelete(int[] chks) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartDelete(conn, chks);
		System.out.println(rs + "행 삭제됨");
		conn.close();
		return rs;
	}

	public int cartDeleteOne(int cno) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartDeleteOne(conn, cno);
		System.out.println(rs + "행 삭제됨");
		conn.close();
		return rs;
	}

	public int cartUpdate(int cno, int oamount) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartUpdate(conn, cno, oamount);
		System.out.println(rs + "행 업데이트됨");
		conn.close();
		return rs;
	}

	public int cartUpdateIns(String bisbn, int oamount, String mid) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartUpdateIns(conn, bisbn, oamount, mid);
		System.out.println(rs + "행 업데이트됨");
		conn.close();
		return rs;
	}

	public int cartUpdateIns2(String mid, Map<String, Integer> updatemap) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = new CartDAO().cartUpdateIns2(conn, mid, updatemap);
		System.out.println(rs + "행 업데이트됨");
		conn.close();
		return rs;
	}
}
