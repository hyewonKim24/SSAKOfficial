package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import notice.model.NoticeVO;

public class NoticeDAO {
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

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

//	NNO      NOT NULL NUMBER(10)     
//	MID      NOT NULL VARCHAR2(30)   
//	NTITLE   NOT NULL VARCHAR2(120)  
//	NDATE             DATE           
//	NCONTENT NOT NULL VARCHAR2(4000) 
//	NVIEW    NOT NULL NUMBER 

	// 공지사항 검색기능
	public List<NoticeVO> noticeSearch(Connection conn, String nSearch, int start, int end) throws SQLException {
		List<NoticeVO> list = null;
		NoticeVO vo = null;
		String sql = "select * from (select ROWNUM rnum, n.* from (select * from notice where ntitle like ? or ncontent like ? order by nno desc) n) where rnum>=? and rnum<=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + nSearch + "%");
			pstmt.setString(2, "%" + nSearch + "%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			rs = pstmt.executeQuery();
			list = new ArrayList<NoticeVO>();
			if (rs.next()) {
				do {
					vo = new NoticeVO();
					vo.setNno(rs.getInt("nno"));
					vo.setNtitle(rs.getString("ntitle"));
					vo.setNcontent(rs.getString("ncontent"));
					vo.setNdate(rs.getDate("ndate"));
					vo.setNview(rs.getInt("nview"));
					vo.setNcount(start++);
					System.out.println("start"+	start);
					list.add(vo);
				} while (rs.next());
			}
		} finally {
			close();
		}
		return list;
	}
	
	// 공지사항 검색 페이징 - 총 검색결과 수
	public int getSearchCount(Connection conn, String nSearch) throws SQLException {
		int cnt = 0;
		String sql = "select COUNT(*) from (select ROWNUM rnum, n.* from (select * from notice where ntitle like ? or ncontent like ? order by nno desc) n)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + nSearch + "%");
			pstmt.setString(2, "%" + nSearch + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} finally {
			close();
		}
		return cnt;
	}
	
	// 공지사항 목록 페이징 - 공지사항 총 글 개수
	public int getBoardCount(Connection conn) throws SQLException {
		int cnt = 0;
		String sql = "select COUNT(*) from notice";
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

	// 공지사항 목록 메소드
	public List<NoticeVO> noticeList(Connection conn, int start, int end) throws SQLException {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO vo = null;
		String sql = "select * from (select ROWNUM rnum, n.* from (select * from notice order by nno desc) n) where rnum >= ? and rnum <= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					vo = new NoticeVO();
					vo.setNno(rs.getInt("nno"));
					vo.setMid(rs.getString("mid"));
					vo.setNtitle(rs.getString("ntitle"));
					vo.setNdate(rs.getTimestamp("ndate"));
					vo.setNcontent(rs.getString("ncontent"));
					vo.setNview(rs.getInt("nview"));
					list.add(vo);
				} while (rs.next());
			}
		} finally {
			close();
		}
		return list;
	}

	// 공지사항 상세페이지
	public NoticeVO noticeDetail(Connection conn, int nno) throws SQLException {
		NoticeVO vo = null;
		String sql = "select * from notice where nno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new NoticeVO();
				vo = new NoticeVO();
				vo.setNno(rs.getInt("nno"));
				vo.setMid(rs.getString("mid"));
				vo.setNtitle(rs.getString("ntitle"));
				vo.setNdate(rs.getTimestamp("ndate"));
				vo.setNcontent(rs.getString("ncontent"));
				vo.setNview(rs.getInt("nview"));
			}
		} finally {
			close();
		}
		return vo;
	}

	// 공지사항 글 작성
	public int noticeWrite(Connection conn, NoticeVO vo) throws SQLException {
		int result = 0;

		String mid = vo.getMid();
		String ntitle = vo.getNtitle();
		String ncontent = vo.getNcontent();
		String sql = "insert into notice values (notice_seq.NEXTVAL,?,?,CURRENT_TIMESTAMP,?,0)";

		// insert
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid); // mid
			pstmt.setString(2, ntitle); // ntitle
			pstmt.setString(3, ncontent); // ncontent
			result = pstmt.executeUpdate();
			if (result < 1) {
				System.out.println("insert 실패");
			}
		} finally {
			close();
		}
		return result;
	}

	// 공지사항 글 수정
	public int noticeUpdate(Connection conn, NoticeVO vo, int nno) throws SQLException {
		int result = 0;
		String sql = "update notice set ntitle=? , ncontent=? where nno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setInt(3, vo.getNno());
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}

	// 공지사항 글 삭제
	public int noticeDelete(Connection conn, int nno) throws SQLException {
		int result = 0;
		String sql = "delete from notice where nno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}
	
	//조회수 메소드
	public int viewCount(Connection conn, int nno) throws SQLException{
		int result = 0;
		String sql = "update notice set nview=nview+1 where nno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		}finally {
			close();
		}
		return result;
	}
}
