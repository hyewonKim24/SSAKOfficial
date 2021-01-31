package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import notice.model.NoticeVO;
import qna.model.QnAVO;

public class QnADAO {
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

	// qna option별 검색
	public List<QnAVO> qnaSearch(Connection conn, String qtype, String qSearch, int start, int end)
			throws SQLException {
		List<QnAVO> list = new ArrayList<QnAVO>();
		try {
			if (qtype == null || qtype.equals("")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("전체")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("주문결제")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ? and qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				pstmt.setString(5, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("커스텀문의")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ? and qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				pstmt.setString(5, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("배송문의")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ? and qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				pstmt.setString(5, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("회원문의")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ? and qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				pstmt.setString(5, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("기타")) {
				String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ? and qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				pstmt.setString(5, qtype);
				rs = pstmt.executeQuery();
			}
			if (rs.next()) {
				do {
					QnAVO vo = new QnAVO();
					vo.setQno(rs.getInt("qno"));
					vo.setMid(rs.getString("mid"));
					vo.setQtitle(rs.getString("qtitle"));
					vo.setQdate(rs.getDate("qdate"));
					vo.setQref(rs.getInt("qref"));
					vo.setQref_step(rs.getInt("qref_step"));
					vo.setQref_level(rs.getInt("qref_level"));
					vo.setQview(rs.getInt("qview"));
					vo.setQcount(start++);
					list.add(vo);
				} while (rs.next());
			}
		} finally {
			close();
		}
		return list;
	}

	// qna option 검색 총 결과 수
	public int qnaSearchCount(Connection conn, String qtype, String qSearch) throws SQLException {
		int cnt = 0;
		try {
			if (qtype == null || qtype.equals("")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				rs = pstmt.executeQuery();

			}
			else if (qtype.equals("전체")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				rs = pstmt.executeQuery();

			}
			else if (qtype.equals("주문결제")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setString(3, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("커스텀문의")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setString(3, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("배송문의")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setString(3, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("회원문의")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setString(3, qtype);
				rs = pstmt.executeQuery();

			} else if (qtype.equals("기타")) {
				String sql = "select COUNT(*) from (select ROWNUM rnum, q.* from (select * from qna where qtitle like ? or qcontent like ? order by qref desc, qref_step asc, qdate desc) q) where qtype=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + qSearch + "%");
				pstmt.setString(2, "%" + qSearch + "%");
				pstmt.setString(3, qtype);
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


	// qna 글/댓글 총 개수
	public int getBoardCount(Connection conn) throws SQLException {
		int cnt = 0;
		String sql = "select COUNT(*) from qna";
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

	// qna 목록 메소드
	public List<QnAVO> qnaList(Connection conn, int start, int end) throws SQLException {
		List<QnAVO> list = new ArrayList<QnAVO>();
		QnAVO vo = null;
		String sql = "select * from (select ROWNUM rnum, q.* from (select * from qna order by qref desc, qref_step asc, qdate desc) q) where rnum >= ? and rnum <= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					vo = new QnAVO();
					vo.setQno(rs.getInt("qno"));
					vo.setMid(rs.getString("mid"));
					vo.setQtitle(rs.getString("qtitle"));
					vo.setQdate(rs.getDate("qdate"));
					vo.setQcontent(rs.getString("qcontent"));
					vo.setQref(rs.getInt("qref"));
					vo.setQref_step(rs.getInt("qref_step"));
					vo.setQref_level(rs.getInt("qref_level"));
					vo.setQview(rs.getInt("qview"));
					vo.setQtype(rs.getString("qtype"));
					list.add(vo);
				} while (rs.next());
			}
		} finally {
			close();
		}
		return list;
	}

	// qna 상세 메소드
	public QnAVO qnaDetail(Connection conn, int nno) throws SQLException {
		QnAVO vo = null;
		String sql = "select * from qna where qno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new QnAVO();
				vo.setQno(rs.getInt("qno"));
				vo.setMid(rs.getString("mid"));
				vo.setQtitle(rs.getString("qtitle"));
				vo.setQdate(rs.getDate("qdate"));
				vo.setQcontent(rs.getString("qcontent"));
				vo.setQref(rs.getInt("qref"));
				vo.setQref_step(rs.getInt("qref_step"));
				vo.setQref_level(rs.getInt("qref_level"));
				vo.setQview(rs.getInt("qview"));
				vo.setQtype(rs.getString("qtype"));
			}
		} finally {
			close();
		}
		return vo;
	}

	// qna 문의 글 등록
	public int qnaWrite(Connection conn, QnAVO vo) throws SQLException {
		int result = 0;
		System.out.println("qwrite dao 진입");
		int qno = vo.getQno();
		String mid = vo.getMid();
		String qtitle = vo.getQtitle();
		String qcontent = vo.getQcontent();
		int qref = vo.getQref();
		int qref_step = vo.getQref_step();
		int qref_level = vo.getQref_level();
		String qtype = vo.getQtype();

		// 가장 큰 bno를 읽어나오는 query
		String sql_max = "select nvl(max(qno),0) from qna";
		int maxQno = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql_max);
			if (rs.next()) {
				maxQno = rs.getInt(1) + 1;
			} else {
				System.out.println("sql 에러발생");
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		try {
			String sql_insert = "insert into qna values (?,?,?,CURRENT_TIMESTAMP,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setInt(1, maxQno);
			pstmt.setString(2, mid);
			pstmt.setString(3, qtitle);
			pstmt.setString(4, qcontent);
			pstmt.setInt(5, maxQno);
			pstmt.setInt(6, qref_step + 1); // qref_step + 1
			pstmt.setInt(7, qref_level + 1); // qref_level + 1
			pstmt.setString(8, qtype);
			result = pstmt.executeUpdate();

			if (result < 1) {
				System.out.println("insert 실패");
			}
		} finally {
			close();
		}
		return result;
	}

	// qna 댓글 작성
	public int qnaReply(Connection conn, QnAVO vo) throws SQLException {
		int result = 0;

		int qno = vo.getQno();
		String mid = vo.getMid();
		String qtitle = vo.getQtitle();
		String qcontent = vo.getQcontent();
		int qref = vo.getQref();
		int qref_step = vo.getQref_step();
		int qref_level = vo.getQref_level();
		String qtype = vo.getQtype();

		// 가장 큰 bno를 읽어나오는 query
		String sql_max = "select nvl(max(qno),0) from qna";
		int maxQno = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql_max);
			if (rs.next()) {
				maxQno = rs.getInt(1) + 1;
			} else {
				System.out.println("sql 에러발생");
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		// 기존 글 ref 업데이트
		try {
			if (qno == 0) {
				qno = maxQno;
			} else {
				String sql_update = "update qna set qref_step=qref_step+1 where qref=? and qno<>? and qref_step>?";

				System.out.println("업데이트 메소드" + qno + " : " + qref + " : " + qref_step + " : " + qref_level);
				pstmt = conn.prepareStatement(sql_update);
				pstmt.setInt(1, qref);
				pstmt.setInt(2, qref);
				pstmt.setInt(3, qref_step);
				result = pstmt.executeUpdate();
				pstmt.close();
			}

			// insert
			String sql_insert = "insert into qna values (?,?,?,CURRENT_TIMESTAMP,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql_insert);
			pstmt.setInt(1, maxQno);
			pstmt.setString(2, mid);
			pstmt.setString(3, qtitle);
			pstmt.setString(4, qcontent);
			pstmt.setInt(5, qref);
			pstmt.setInt(6, qref_step + 1);
			pstmt.setInt(7, qref_level + 1);
			pstmt.setString(8, qtype);
			result = pstmt.executeUpdate();
			if (result < 1) {
				System.out.println("insert 실패");
			}
		} finally {
			close();
		}
		return result;
	}

	// qna 글 수정
	public int qnaUpdate(Connection conn, QnAVO vo, int qno) throws SQLException {
		int result = 0;
		String sql = "update qna set qtype=?, qtitle=? , qcontent=? where qno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQtype());
			pstmt.setString(2, vo.getQtitle());
			pstmt.setString(3, vo.getQcontent());
			pstmt.setInt(4, vo.getQno());
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}

	// qna 글 삭제
	public int qnaDelete(Connection conn, int qref) throws SQLException {
		int result = 0;
		String sql = "delete from qna where qref=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qref);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}

	// 조회수 메소드
	public int viewCount(Connection conn, int qno) throws SQLException {
		int result = 0;
		String sql = "update qna set qview=qview+1 where qno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			result = pstmt.executeUpdate();
		} finally {
			close();
		}
		return result;
	}
}
