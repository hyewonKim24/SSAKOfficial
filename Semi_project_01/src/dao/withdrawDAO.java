package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import Withdraw.model.*;




public class withdrawDAO {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = null;
	
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
			}catch(SQLException e) {
				e.printStackTrace();
			}
		
		
	}

	
	// 공지사항 목록 페이징 - 공지사항 총 글 개수 
	public int getBoardCount(Connection conn) throws SQLException {
		int cnt = 0;
		String sql = "select COUNT(*) from withdraw";
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


	// 공지사항 전체 목록 메소드
	public List<WithdrawVO> getBoardPage (Connection conn, int start, int end) throws SQLException{
		List<WithdrawVO> list = new ArrayList<WithdrawVO>();
		WithdrawVO wvo = null;
		String sql = "select * from (select ROWNUM rnum, wd.* from (select * from withdraw order by wno desc) wd) where rnum >= ? and rnum <= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					wvo = new WithdrawVO();
					wvo.setWno(rs.getInt("wno"));
					wvo.setMid(rs.getString("mid"));
					wvo.setWrer(rs.getString("wrer"));
					wvo.setWred(rs.getDate("wred"));
					wvo.setWacd(rs.getString("wacd").charAt(0));
					list.add(wvo);
				}while(rs.next());
			}
		}finally {
			close();
		}
		return list;
	}
	
	public List<WithdrawVO> wreqList(Connection conn) throws SQLException{
		List<WithdrawVO> wList = null;
		String sql ="select * from withdraw";
		try { 
			System.out.println("dao까지 옴");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				wList = new ArrayList<WithdrawVO>();
				do {
					WithdrawVO wvo = new WithdrawVO();
					wvo.setWno(rs.getInt("wno"));
					wvo.setMid(rs.getString("mid"));
					wvo.setWrer(rs.getString("wrer"));
					wvo.setWred(rs.getDate("wred"));
					wvo.setWacd(rs.getString("wacd").charAt(0));
					System.out.println(wvo.toString());
					wList.add(wvo);
				}while(rs.next());
			}
		} finally {
			close();
		}
		return wList;
	}
	
	public WithdrawVO wreqDetail(Connection conn, String mid) throws SQLException {
		WithdrawVO wvo = null;
		String sql = "select * from withdraw where mid =?";
		try {
			System.out.println("dao까지 옴");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				wvo = new WithdrawVO();
				wvo.setMid(rs.getString("mid"));
				wvo.setWrer(rs.getString("wrer"));
				wvo.setWred(rs.getDate("wred"));
				wvo.setWacd(rs.getString("wacd").charAt(0));
			}
		} finally {
			close();
		}
		return wvo;
	}
	
	public int wreqAccept(Connection conn, String mid) throws SQLException {
		int result = 0;
		String sql = "update withdraw set wacd ='y' where mid=?";
//				"delete from member m where exists (select mid from withdraw w where m.mid = w.mid and w.mid ='?')";
		try {
			System.out.println("dao까지 옴");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}
	
	public int wrerInsert(Connection conn, WithdrawVO wvo) throws SQLException {
		int result = 0;
		String sql = "insert into withdraw values(withdraw_seq.nextval,?,?,?,'N')";
		try {
			System.out.println("dao까지 옴");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wvo.getMid());
			pstmt.setString(2, wvo.getWrer());
			pstmt.setDate(3, wvo.getWred());
			
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}
	
}
