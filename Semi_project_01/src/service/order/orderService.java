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
	private DataSource ds=null;
	private Connection conn=null;
	
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
		cnt = new orderDAO().getBoardCount(conn);
		return cnt;
	}finally {
		close();
	}
	}
	
	public List<orderVO> getBoardPage (int start, int end) throws SQLException{
		try {
		Connection conn = ds.getConnection();
		List<orderVO> pagelist = null;
		pagelist = new orderDAO().getBoardPage(conn, start, end);
		return pagelist;
	}finally {
		close();
	}
	}
	
	public List<orderVO> orderList() throws SQLException{
		try {
		Connection conn = ds.getConnection();
		List<orderVO> ovo = null;
		ovo = new orderDAO().orderList(conn);
		return ovo;
	}finally {
		close();
	}
		
	}

//	public orderVO orderDetail(String mid) throws SQLException {
//		try {
//		Connection conn = ds.getConnection();
//		orderVO odetail = null;
//		odetail = new orderDAO().orderDetail(conn, mid);
//		return odetail;
//	}finally {
//		close();
//	}
//	}

	public List<orderVO> orderDetail(String mid) throws SQLException {
		List<orderVO> odetail = null;
		try {
		Connection conn = ds.getConnection();
		odetail = new orderDAO().orderDetail(conn, mid);
	}finally {
		close();
	}
		return odetail;
	}


	public List<CartListVO> orderList(int[] chks) throws SQLException {
		Connection conn = ds.getConnection();
		List list = new orderDAO().orderList(conn, chks);
		conn.close();
		return list;
	}
	
	public List<CartListVO> directOrderList(String bisbn, int dno) throws SQLException {
		Connection conn = ds.getConnection();
		List list = new orderDAO().directOrderList(conn, bisbn, dno);
		conn.close();
		return list;
	}
	
	public int orderInsert(orderVO vo, int[] dno, String[] bisbn, int[] oamount) throws SQLException {
		Connection conn = ds.getConnection();
		//order insert 
		int rs = new orderDAO().orderInsert(conn, vo);
		//neworder insert
		int rs1 = new orderDAO().orderInsert2(conn,dno,bisbn,oamount);
		System.out.println(rs + "행 추가됨");
		System.out.println(rs1 + "행 추가됨");
		conn.close();
		return rs;
	}
	

}
