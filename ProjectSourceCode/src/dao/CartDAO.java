package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cart.model.CartListVO;
import cart.model.CartVO;



public class CartDAO {
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private void close() {
		try {
			if(rs!=null) {
				rs.close();
				rs=null;
			}
			if(pstmt!=null) {
				pstmt.close();
				pstmt=null;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//카트 리스트
	public List<CartListVO> cartList(Connection conn, String mid) throws SQLException{
		List<CartListVO> cartlist = new ArrayList<CartListVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.bcover, b.btitle, c.oamount, b.bpriceStandard, b.bpriceSales, dno2, c.bisbn, c.mid, bc.ddesc, bc.dimg, bc.dprice, c.cno" + 
				" from (select cno,mid,nvl(dno,0) as dno2, bisbn,oamount from cart) c, book b, bookcover bc" + 
				" where c.mid = ? and c.bisbn=b.bisbn and dno2=bc.dno";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					CartListVO vo = new CartListVO();
					vo.setMid(mid);		
					vo.setBcover(rs.getString(1));
					vo.setBtitle(rs.getString(2));
					vo.setOamount(rs.getInt(3));
					vo.setBpricestandard(rs.getInt(4));
					vo.setBpricesales(rs.getInt(5));
					vo.setDno(rs.getInt(6));
					vo.setBisbn(rs.getString(7));
					vo.setDdesc(rs.getString(9));
					vo.setDimg(rs.getString(10));
					vo.setDprice(rs.getInt(11));
					vo.setCno(rs.getInt(12));
					
					cartlist.add(vo);
				} while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cartlist;
	};
	
	//카트 추가
	public int cartInsert(Connection conn, CartVO vo) {
		System.out.println("Insert 시작");
		int result=0;
		String sql = "insert into cart(cno, mid, dno, bisbn, oamount) values(cno_se.nextval,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setInt(2, vo.getDno());
			pstmt.setString(3, vo.getBisbn());
			pstmt.setInt(4, vo.getOamount());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 일괄추가
	public int cartInserts(Connection conn, String mid, Map<String,Integer> insertmap) {
		System.out.println("Insert 시작");
		int result=0;
		String sql = "insert into cart(cno, mid, dno, bisbn, oamount) values(cno_se.nextval,?,0,?,?)";
		try {
			Iterator<String> entries = insertmap.keySet().iterator();
			while(entries.hasNext()){
				String key = entries.next();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, key);
				pstmt.setInt(3, insertmap.get(key));
				result += pstmt.executeUpdate();	
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 일괄 삭제
	public int cartDelete(Connection conn, int[] chks) {
		int result=0;
		String params="";
		for(int i=0; i<chks.length; i++) {
			params += chks[i];
			if(i < chks.length-1)
				params += ",";
		}
		String sql = "delete from cart where cno IN ("+params+")";
		try {
			pstmt=conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 개별 삭제
	public int cartDeleteOne(Connection conn, int cno) {
		int result=0;
		String sql = "delete from cart where cno=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 업데이트(수량변경)
	public int cartUpdate(Connection conn, int cno, int oamount) {
		int result=0;
		String sql="Update cart set oamount=? where cno=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, oamount);
			pstmt.setInt(2, cno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 개별 책 중복 책 업데이트
	public int cartUpdateIns(Connection conn, String bisbn, int oamount, String mid) {
		int result=0;
		String sql="Update cart set oamount=? where bisbn=? and dno=0 and mid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, oamount);
			pstmt.setString(2, bisbn);
			pstmt.setString(3, mid);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//카트 여러개담기 책 중복 업데이트
	public int cartUpdateIns2(Connection conn, String mid, Map<String,Integer> updatemap) {
		int result=0;
		String sql="Update cart set oamount=? where bisbn=? and dno=0 and mid=?";
		try {
			Iterator<String> entries = updatemap.keySet().iterator();
			while(entries.hasNext()){
				String key = entries.next();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, updatemap.get(key));
				pstmt.setString(2, key);
				pstmt.setString(3, mid);
				result = pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//혜원 코드 추가 (장바구니 뿌리기)
	public int CartCount(Connection conn, String mid) throws SQLException {
		int result=0;
		String sql="select count(*) from cart where mid=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println(result+"개 장바구니 갯수");
			}
			
		}finally {
			close();
		}
		return result;
		
	}


	
	//선생님이 써주신 다른책 같은 수량 업데이트 방법
//		public int cartUpdateInsSelect(Connection conn, String[] bisbn, int[] oamount) {
//			int result=0;
////			String sql="Update cart set oamount=? where bisbn=? and dno=0";
//			String sql="Update cart set oamount=(oamount+1) ";
//			if(bisbn.length > 0) {
//				sql+= " where bisbn=" + bisbn[0];
//			}
//			for(int i = 1; i<bisbn.length; i++) {
//				sql+= " or bisbn=" + bisbn[i];
//			}
//			sql+= " and dno=0"; 
//			try {
//				stmt=conn.createStatement();
////				pstmt.setInt(1, oamount);
////				pstmt.setString(2, bisbn);
//				result = stmt.executeUpdate(sql);
//			} catch(Exception e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}
//			return result;
//		}

		

}
