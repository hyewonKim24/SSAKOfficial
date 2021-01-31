package service.bookcover;

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

import bookcover.model.*;
import cart.model.CartListVO;
import cart.model.CartVO;
import dao.BookCoverDAO;
import dao.BookDAO;
import dao.orderDAO;

public class bookCoverService {
	
	public int bookCoverInsert(String customURL, CartVO vo) throws SQLException{
		Connection conn = getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().bookCoverInsert(conn, customURL);
			System.out.println("bookcover서비스"+rs);
			rs += new BookCoverDAO().cartInsert(conn, vo);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return rs;
	}
	public int bookCoverOrder(String customURL, CartVO vo) throws SQLException{
		Connection conn = getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().bookCoverInsert(conn, customURL);
			System.out.println("bookcover서비스"+rs);
			rs += new BookCoverDAO().cartInsert(conn, vo);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return rs;
	}
	
	public int SelectDno(String customURL) throws SQLException {
		Connection conn = getConnection();
		int rs = 0;
		int dno =0;
		rs = new BookCoverDAO().bookCoverInsert(conn, customURL);
		dno= new BookCoverDAO().selectDno(conn);
		System.out.println(dno+"주문 dno찾기");
		close(conn);
		return dno;
	}
	
	public List<CartListVO> directOrderList(String bisbn,int dno) throws SQLException {
		Connection conn = getConnection();
		List list = new orderDAO().directOrderList(conn, bisbn, dno);
		close(conn);
		return list;
	}
	
////이혜림 추가
	public int cstImgUploadtoCart(String customURL) throws SQLException {
		Connection conn = getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().cstImgUploadtoCart(conn, customURL);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return rs;
	}

	public int cstImgUploadtoOrder(String customURL) throws SQLException {
		Connection conn = getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().cstImgUploadtoOrder(conn, customURL);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit(conn);
			else
				rollback(conn);
		} finally {
			close(conn);
		}
		return rs;
	}
}
