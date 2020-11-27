package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cart.model.CartListVO;

import member.model.*;
import order.model.*;

public class orderDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = null;

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
	//혜림코드
	// 회원관리- 주문조회 검색했을때 뿌려지는 애들
			//// qna option별 검색
			public List<orderVO> orderSearch(Connection conn, String otype, String osearchbar, int start, int end) throws SQLException {
				List<orderVO> olist = new ArrayList<orderVO>();
				orderVO ovo = null;
				System.out.println("다오에 접근");
				try {
					if (otype == null || otype == "") {
						String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? or mid like ? or oamount like ? or ototalprice like ? or oname like ? or ophone like ? or opay like ? order by ono) o) where rnum >= ? and rnum <= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setString(2, "%" + osearchbar + "%");
						pstmt.setString(3, "%" + osearchbar + "%");
						pstmt.setString(4, "%" + osearchbar + "%");
						pstmt.setString(5, "%" + osearchbar + "%");
						pstmt.setString(6, "%" + osearchbar + "%");
						pstmt.setString(7, "%" + osearchbar + "%");
						pstmt.setInt(8, start);
						pstmt.setInt(9, end);
						rs = pstmt.executeQuery();

					} else if (otype.equals("1")) {
						String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? or mid like ? or oamount like ? or ototalprice like ? or oname like ? or ophone like ? or opay like ? order by ono) o) where rnum >= ? and rnum <= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setString(2, "%" + osearchbar + "%");
						pstmt.setString(3, "%" + osearchbar + "%");
						pstmt.setString(4, "%" + osearchbar + "%");
						pstmt.setString(5, "%" + osearchbar + "%");
						pstmt.setString(6, "%" + osearchbar + "%");
						pstmt.setString(7, "%" + osearchbar + "%");
						pstmt.setInt(8, start);
						pstmt.setInt(9, end);
						rs = pstmt.executeQuery();

					} else if (otype.equals("2")) {
						String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? order by ono) o) where rnum >= ? and rnum <= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, end);
						rs = pstmt.executeQuery();
					} else if (otype.equals("3")) {
						String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 where mid like ? order by ono) o) where rnum >= ? and rnum <= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, end);
						rs = pstmt.executeQuery();
					} else if (otype.equals("4")) {
						String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 where oname like ? order by ono) o) where rnum >= ? and rnum <= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, end);
						rs = pstmt.executeQuery();
					}
					
					if (rs.next()) {
						do {
							ovo = new orderVO();
							ovo.setOno(rs.getInt("ono"));
							ovo.setMid(rs.getString("mid"));
							ovo.setOamount(rs.getInt("oamount"));
							ovo.setOtotalprice(rs.getInt("ototalprice"));
							ovo.setOname(rs.getString("oname"));
							ovo.setOphone(rs.getString("ophone"));
							ovo.setOpay(rs.getString("opay"));
							olist.add(ovo);
						} while (rs.next());
					}
				} finally {
					close();
				}
				return olist;
			}

			//// 검색 총 결과 수
			public int orderSearchCount(Connection conn, String otype, String osearchbar) throws SQLException {
				int cnt = 0;
				
				try {
					if (otype == null || otype == "") {
						String sql = "select COUNT(*) from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? or mid like ? or oamount like ? or ototalprice like ? or oname like ? or ophone like ? or opay like ? order by ono) o)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setString(2, "%" + osearchbar + "%");
						pstmt.setString(3, "%" + osearchbar + "%");
						pstmt.setString(4, "%" + osearchbar + "%");
						pstmt.setString(5, "%" + osearchbar + "%");
						pstmt.setString(6, "%" + osearchbar + "%");
						pstmt.setString(7, "%" + osearchbar + "%");
						rs = pstmt.executeQuery();

					} else if (otype.equals("1")) {
						String sql = "select COUNT(*) from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? or mid like ? or oamount like ? or ototalprice like ? or oname like ? or ophone like ? or opay like ? order by ono) o)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						pstmt.setString(2, "%" + osearchbar + "%");
						pstmt.setString(3, "%" + osearchbar + "%");
						pstmt.setString(4, "%" + osearchbar + "%");
						pstmt.setString(5, "%" + osearchbar + "%");
						pstmt.setString(6, "%" + osearchbar + "%");
						pstmt.setString(7, "%" + osearchbar + "%");
						rs = pstmt.executeQuery();

					} else if (otype.equals("2")) {
						String sql = "select COUNT(*) from (select ROWNUM rnum, o.* from (select * from order2 where ono like ? order by ono) o)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						
						rs = pstmt.executeQuery();
					} else if (otype.equals("3")) {
						String sql = "select COUNT(*) from (select ROWNUM rnum, o.* from (select * from order2 where mid like ? order by ono) o)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
						
						rs = pstmt.executeQuery();
					} else if (otype.equals("4")) {
						String sql = "select COUNT(*) from (select ROWNUM rnum, o.* from (select * from order2 where oname like ? order by ono) o)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + osearchbar + "%");
					
						rs = pstmt.executeQuery();
					}
					if (rs.next()) {
						cnt = rs.getInt(1);
					}
				} finally {
					close();
				}
				return cnt;
			}

		// 주문내 리스트 첫 목록 - 총 글 개수 
			// 공지사항 전체 목록 메소드
			public List<orderVO> getBoardPage(Connection conn, int start, int end) throws SQLException {
				List<orderVO> olist = new ArrayList<orderVO>();
				orderVO ovo = null;
				String sql = "select * from (select ROWNUM rnum, o.* from (select * from order2 order by ono desc) o) where rnum >= ? and rnum <= ?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						do {
							ovo = new orderVO();
							ovo.setOno(rs.getInt("ono"));
							ovo.setMid(rs.getString("mid"));
							//오류가 나서 수정,,
							ovo.setOamount(rs.getInt("ototalamount"));
							ovo.setOtotalprice(rs.getInt("ototalprice"));
							ovo.setOname(rs.getString("oname"));
							ovo.setOphone(rs.getString("ophone"));
							ovo.setOpay(rs.getString("opay"));
							olist.add(ovo);
						} while (rs.next());
					}
				} finally {
					close();
				}
				return olist;
			}

			// 공지사항 목록 페이징 - 공지사항 총 글 개수
			public int getBoardCount(Connection conn) throws SQLException {
				int cnt = 0;
				String sql = "select COUNT(*) from order2";
				try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if (rs.next()) {
						cnt = rs.getInt(1);
					}
				} finally {
					close();
				}
				return cnt;
			}

			public List<orderVO> orderDetail(Connection conn, String mid, int ono) throws SQLException {
				List<orderVO> odList = null;
				String sql = "select o.mid, o.ono, o.odate, b.bisbn, b.bcover, b.btitle, b.bpriceStandard, b.bpricesales, o.opay, o.odprice, o.ototalprice, o.oname, o.ophone, o.oaddr1, n.dno, n.oamount"
								+" from order2 o, neworder2 n, bookcover bc, (select bisbn, btitle, bcover, bpriceStandard, bpriceSales from book) b"
								+" where o.mid=? and o.ono = n.ono and n.bisbn=b.bisbn and n.dno = bc.dno and o.ono=?";
				try {
		 			System.out.println("orderdetail까지 옴");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mid);
					pstmt.setInt(2, ono);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						odList = new ArrayList<orderVO>();
						do {
						orderVO ovo = new orderVO();
						ovo.setMid(mid);
						ovo.setOno(rs.getInt("ono"));
						ovo.setOdate(rs.getDate("odate"));
						ovo.setBISBN(rs.getString("BISBN"));
						ovo.setBcover(rs.getString("bcover"));
						ovo.setBtitle(rs.getString("btitle"));
						ovo.setBpriceStandard(rs.getInt("bpriceStandard"));
						ovo.setBpricesales(rs.getInt("bpricesales"));
						ovo.setOpay(rs.getString("opay"));
						ovo.setOdprice(rs.getInt("odprice"));
						ovo.setOtotalprice(rs.getInt("ototalprice"));
						ovo.setOname(rs.getString("oname"));
						ovo.setOphone(rs.getString("ophone"));
						ovo.setOaddr1("oaddr1");
						ovo.setDno(rs.getInt("dno"));
						ovo.setOamount(rs.getInt("oamount"));
						odList.add(ovo);
						}while(rs.next());
					}
				} finally {
					close();
				}
				return odList;
			}
	
	//혜원코드
	//myOrderList
	public List<orderVO> myOrderlist(Connection conn, String mid) throws SQLException {
		List<orderVO> odList = null;
		
		String sql = "select case when a.rnm = 1 then a.btitle" + 
				" else a.btitle || ' 외 ' ||(a.rnm-1)|| '권' end as btitle," + 
				"a.ono as ono, a.odate as odate, a.ototalamount as ototalamount," + 
				"a.ostatus as ostatus, a.ototalprice as ototalprice, a.bcover as bcover" + 
				" from(" + 
				"select row_number() over(partition by o.ono order by o.ono) as rnm," + 
				"o.mid as mid, o.ono as ono ,o.odate as odate, o.ototalamount as ototalamount," + 
				"o.ostatus as ostatus, o.ototalprice as ototalprice, b.bcover as bcover, b.btitle as btitle" + 
				" from order2 o, neworder2 n, (select btitle, bcover, bisbn from book) b" + 
				" where o.mid=? and n.ono=o.ono and n.bisbn=b.bisbn" + 
				" group by o.mid, o.ono, o.odate, o.ototalamount, o.ostatus, o.ototalprice, b.bcover, b.btitle" + 
				" order by ono, rnm desc)a," + 
				"(select count(ono) as rnm, ono as ono from neworder2 group by ono) c" + 
				" where a.ono=c.ono and a.mid=? and a.rnm=c.rnm order by ono desc";
		try {
			System.out.println("myorderlist까지 옴");
			pstmt = conn.prepareStatement(sql);
			System.out.println(mid);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				odList = new ArrayList<orderVO>();
				
				do {
				orderVO ovo = new orderVO();
				ovo.setOno(rs.getInt("ono"));
				ovo.setOdate(rs.getDate("odate"));
				System.out.println("totalamount확인+"+rs.getInt("ototalamount"));
				ovo.setOamount(rs.getInt("ototalamount"));
				ovo.setOtotalprice(rs.getInt("ototalprice"));
				ovo.setOstatus(rs.getString("ostatus"));
				ovo.setBcover(rs.getString("bcover"));
				ovo.setBtitle(rs.getString("btitle"));
				odList.add(ovo);
				}while(rs.next());
			}
		} finally {
			close();
		}
		return odList;
	}
	
	
	
	//은실 코드
	// 장바구니에서 불러오기
	public List<CartListVO> orderList(Connection conn, int[] chks) throws SQLException {
		List<CartListVO> cartlist = new ArrayList<CartListVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String params = "";
		for (int i = 0; i < chks.length; i++) {
			params += chks[i];
			if (i < chks.length - 1)
				params += ",";
		}

		String sql = "select b.bcover, b.btitle, c.oamount, b.bpriceStandard, b.bpriceSales, dno2, c.bisbn, c.mid, bc.ddesc, bc.dimg, bc.dprice, c.cno"
				+ " from (select cno,mid,nvl(dno,0) as dno2, bisbn,oamount from cart) c, book b, bookcover bc"
				+ " where cno IN (" + params + ") and c.bisbn=b.bisbn and dno2=bc.dno";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					CartListVO vo = new CartListVO();
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
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cartlist;
	};

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
//				pstmt.setInt(1, vo2.get(i).getDno());
//				pstmt.setString(2, vo2.get(i).getBisbn());
//				pstmt.setInt(3, vo2.get(i).getOamount());
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
//		}
//		if(vo2.size()!=result) {
//			return -1;
//		}

		return result;
	}
}
