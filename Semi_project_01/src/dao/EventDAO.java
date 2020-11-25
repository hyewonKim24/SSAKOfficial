package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import event.model.EventVO;


public class EventDAO {
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
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
	
	//이벤트 댓글목록
	public List<EventVO> eventList(Connection conn, int start, int end) throws SQLException{
		List<EventVO> eventlist = new ArrayList<EventVO>();
		PreparedStatement pstmt = null;
//		String sql = "select eno, mid, econtent, edate from event order by eno desc";
		String sql = "select * from (select ROWNUM rnum, e.* from (select * from event order by eno desc) e) where rnum >= ? and rnum <= ?";
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				do {
					EventVO vo = new EventVO();
					vo.setEno(rs.getInt("eno"));
					vo.setMid(rs.getString("mid"));
					vo.setEcontent(rs.getString("econtent"));
					vo.setEdate(rs.getDate("edate"));
					eventlist.add(vo);
				} while(rs.next());
			} else {
				System.out.println("찾는 데이터가 없습니다.");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return eventlist;
	}
	
	//댓글 작성
	public int eventWrite(Connection conn, EventVO vo) {
		System.out.println("Insert 시작");
		int result=0;
		String sql = "insert into event values (seq_id.nextval, ?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getEcontent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	
	//댓글 수정
	public int eventUpdate(Connection conn, String econtent, int eno) {
		EventVO vo = new EventVO();
		int result=0;
		String sql = "update event set econtent=? where eno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, econtent);
			pstmt.setInt(2, eno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//댓글 삭제
	public int eventDelete(Connection conn, int eno) {
		EventVO vo = new EventVO();
		int result=0;
		String sql = "delete from event where eno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int eventCount(Connection conn) throws SQLException {
		int cnt = 0;
		String sql = "select COUNT(*) from event";
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

}

