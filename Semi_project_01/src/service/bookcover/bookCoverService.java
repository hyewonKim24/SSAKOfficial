package service.bookcover;


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bookcover.model.*;
import cart.model.CartVO;
import dao.BookCoverDAO;
import dao.BookDAO;

public class bookCoverService {
	private DataSource ds = null; // Datasource ds는 아파치톰캣(WAS)가 제공하는 DBCP(CB connection pool)이다.
	private Connection conn = null;

	public bookCoverService() {
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
	public int bookCoverInsert(String customURL, CartVO vo) throws SQLException{
		Connection conn = ds.getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().bookCoverInsert(conn, customURL);
			System.out.println("bookcover서비스"+rs);
			rs += new BookCoverDAO().cartInsert(conn, vo);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return rs;
	}
	
////이혜림 추가
	public int cstImgUploadtoCart(String customURL) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().cstImgUploadtoCart(conn, customURL);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return rs;
	}

	public int cstImgUploadtoOrder(String customURL) throws SQLException {
		Connection conn = ds.getConnection();
		int rs = 0;
		try {
			rs = new BookCoverDAO().cstImgUploadtoOrder(conn, customURL);
			conn.setAutoCommit(false);
			if(rs > 0)
				commit();
			else
				rollback();
		} finally {
			close();
		}
		return rs;
	}
}
