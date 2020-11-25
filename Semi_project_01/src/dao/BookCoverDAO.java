package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bookcover.model.*;
import cart.model.CartListVO;
import cart.model.CartVO;
import order.model.orderVO;


public class BookCoverDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Statement stmt = null;

	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
//	private int dno;
//	private String ddesc;
//	private String dimg;
//	private int dprice;
	
	public int bookCoverInsert(Connection conn, String customURL) throws SQLException{
		System.out.println("bookcover INSERT 시작");
		int result =0;
		String sql= "insert into bookcover values(cst_seq.nextval, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "북커버입니다");
			pstmt.setString(2, customURL);
			pstmt.setInt(3, 0);
			result=pstmt.executeUpdate();
			
		} finally {
			close();
		}
		return result;
	}
	
	public int selectDno(Connection conn) throws SQLException{
		System.out.println("bookcover dno 찾기");
		int result =0;
		String sql= "select max(dno) from bookcover";
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} finally {
			close();
		}
		return result;
	}
	
/////// 북커버 커스텀 관련 이혜림 추가
	public int cstImgUploadtoCart(Connection conn, String customURL) throws SQLException{
		int rs = 0;
		//여기 은실이꺼 cart insert랑 맞춰야함
		String sql = "insert into cart(custom) values(?)";
		try {
		System.out.println("custom cart 다오까지 옴");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customURL);
		rs = pstmt.executeUpdate();
		} finally {
			close();
		}
		return rs;
	}
	
	public int cstImgUploadtoOrder(Connection conn, String customURL) throws SQLException{
		int rs = 0;
		//여기 은실이꺼 order insert랑 맞춰야함
		String sql = "insert into order2(ono, mid, custom) values(od_seq.nextval, 'lim777', ?)";
		try {
		System.out.println("custom order 다오까지 옴");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customURL);
		
		rs = pstmt.executeUpdate();
		} finally {
			close();
		}
		return rs;
	}

	public int cartInsert(Connection conn, CartVO vo) {
		System.out.println("Insert 시작");
		int result=0;
		String sql = "insert into cart(cno, mid, dno, bisbn, oamount) values(cno_se.nextval,?,cst_seq.currval,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getBisbn());
			pstmt.setInt(3, vo.getOamount());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 바로 주문하기
		public List<CartListVO> directOrderList(Connection conn, String bisbn, int dno) throws SQLException {
			List<CartListVO> cartlist = new ArrayList<CartListVO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select b.bcover, b.btitle, b.bpriceStandard, b.bpricesales, bc.ddesc, bc.dimg, bc.dprice"
					+ " from book b, bookcover bc" + " where b.BISBN=? and bc.dno=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bisbn);
				pstmt.setInt(2, dno);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					CartListVO vo = new CartListVO();
					vo.setBcover(rs.getString(1));
					vo.setBtitle(rs.getString(2));
					vo.setBpricestandard(rs.getInt(3));
					vo.setBpricesales(rs.getInt(4));
					vo.setBisbn(bisbn);
					vo.setDdesc(rs.getString(5));
					vo.setDimg(rs.getString(6));
					vo.setDprice(rs.getInt(7));
					vo.setDno(dno);
					
					cartlist.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}

			return cartlist;
		};

		// 주문완료(인서트 order)
		public int orderInsert(Connection conn, orderVO vo) {
			System.out.println("Insert 시작");
			int result = 0;
			String sql = "insert into order2(ono, mid, odate, odprice, ototalprice, osalesprice, oname, ophone, oaddr1, oaddr2, oaddr3, omemo, opay, ototalamount, ostatus) values(ono_se.nextval,?,sysdate,2500,?,?,?,?,?,?,?,?,?,?,'주문완료')";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setInt(2, vo.getOtotalprice());
				pstmt.setInt(3, vo.getOsalesprice());
				pstmt.setString(4, vo.getOname());
				pstmt.setString(5, vo.getOphone());
				pstmt.setString(6, vo.getOaddr1());
				pstmt.setString(7, vo.getOaddr2());
				pstmt.setString(8, vo.getOaddr3());
				pstmt.setString(9, vo.getOmemo());
				pstmt.setString(10, vo.getOpay());
				pstmt.setInt(11, vo.getOtotalamount());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return result;
		}
		
		

		// 주문완료(인서트 neworder)
		public int orderInsert2(Connection conn, int[] dno, String[] bisbn, int[] oamount) {
			System.out.println("Insert 시작");
			for (int i = 0; i < bisbn.length; i++) {
				System.out.println("dno:" + dno[i]);
				System.out.println("bisbn" + bisbn[i]);
				System.out.println("oamount:" + oamount[i]);
			}
			int result = 0;
			String sql = "insert into neworder2(ono, dno, bisbn, oamount) values(ono_se.currval,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				for (int i = 0; i < bisbn.length; i++) {
//					pstmt.setInt(1, vo2.get(i).getDno());
//					pstmt.setString(2, vo2.get(i).getBisbn());
//					pstmt.setInt(3, vo2.get(i).getOamount());
					pstmt.setInt(1, dno[i]);
					pstmt.setString(2, bisbn[i]);
					pstmt.setInt(3, oamount[i]);
					System.out.println(dno[i] + "으" + bisbn[i] + ":" + oamount[i]);
					result += pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
//			}
//			if(vo2.size()!=result) {
//				return -1;
//			}

			return result;
		}
	
	
}
