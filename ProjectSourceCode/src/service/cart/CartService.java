package service.cart;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

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
	
	public List<CartListVO> cartList(String mid) throws SQLException {
		Connection conn = getConnection();
		List<CartListVO> list = new CartDAO().cartList(conn, mid);
		close(conn);
		return list;
	}

	public int cartInserts(String mid, Map<String, Integer> insertmap) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartInserts(conn, mid, insertmap);
		System.out.println(rs + "행 추가됨");
		close(conn);
		return rs;
	}

	public int cartInsert(CartVO vo) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartInsert(conn, vo);
		System.out.println(rs + "행 추가됨");
		close(conn);
		return rs;
	}

	public int cartDelete(int[] chks) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartDelete(conn, chks);
		System.out.println(rs + "행 삭제됨");
		close(conn);
		return rs;
	}

	public int cartDeleteOne(int cno) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartDeleteOne(conn, cno);
		System.out.println(rs + "행 삭제됨");
		close(conn);
		return rs;
	}

	public int cartUpdate(int cno, int oamount) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartUpdate(conn, cno, oamount);
		System.out.println(rs + "행 업데이트됨");
		close(conn);
		return rs;
	}

	public int cartUpdateIns(String bisbn, int oamount, String mid) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartUpdateIns(conn, bisbn, oamount, mid);
		System.out.println(rs + "행 업데이트됨");
		close(conn);
		return rs;
	}

	public int cartUpdateIns2(String mid, Map<String, Integer> updatemap) throws SQLException {
		Connection conn = getConnection();
		int rs = new CartDAO().cartUpdateIns2(conn, mid, updatemap);
		System.out.println(rs + "행 업데이트됨");
		close(conn);
		return rs;
	}
	
	public int CartCount(String mid) throws SQLException {
		Connection conn= getConnection();
		int rs= new CartDAO().CartCount(conn, mid);
		System.out.println(rs+"개의 장바구니 불러옴");
		close(conn);
		return rs;
	}

}
