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
	
	public int getBoardCount() throws SQLException {
		try {
			Connection conn = ds.getConnection();
			int cnt = 0;
			cnt = new withdrawDAO().getBoardCount(conn);
			return cnt;
		}finally {
			close();
		}
	}
	
	public List<WithdrawVO> getBoardPage (int start, int end) throws SQLException{
		try {
		Connection conn = ds.getConnection();
		List<WithdrawVO> pagelist = null;
		pagelist = new withdrawDAO().getBoardPage(conn, start, end);
		return pagelist;
		}finally {
			close();
		}
	}
	public int wrerInsert(WithdrawVO wvo) throws SQLException {
		try {
		Connection conn = ds.getConnection();
		int result = 0;
		result = new withdrawDAO().wrerInsert(conn, wvo);
		System.out.println(result+"행 추가됨.");
		return result;
		}finally {
			close();
		}
	}
	public List<WithdrawVO> wreqList() throws SQLException{
		try {
		Connection conn = ds.getConnection();
		List<WithdrawVO> wvo = null;
		wvo = new withdrawDAO().wreqList(conn);
		return wvo;
		}finally {
			close();
		}
		
	}
	public WithdrawVO wreqDetail(String mid) throws SQLException {
		try {
		Connection conn = ds.getConnection();
		WithdrawVO wdetail = null;
		wdetail = new withdrawDAO().wreqDetail(conn, mid);;
		return wdetail;
		}finally {
			close();
		}
	}
	
	public int wreqAccept(String mid) throws SQLException{
		try {
		Connection conn = ds.getConnection();
		int result = 0;
		result = new withdrawDAO().wreqAccept(conn, mid);
		return result;
		}finally {
			close();
		}
	}
}
