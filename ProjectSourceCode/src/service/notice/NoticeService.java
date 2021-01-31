package service.notice;

import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

import java.sql.*;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import dao.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeService {
				
		public List<NoticeVO> noticeSearch(String nSearch, int start, int end) throws SQLException {
			Connection conn = getConnection();
			List<NoticeVO> list = new NoticeDAO().noticeSearch(conn, nSearch, start, end);
			close(conn);
			return list;
		}
		
		public int getSearchCount(String nSearch) throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().getSearchCount(conn, nSearch);
			close(conn);
			return result;			
		}
		
		
		public int getBoardCount() throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().getBoardCount(conn);
			close(conn);
			return result;
		}

		public List<NoticeVO> noticeList(int start, int end) throws SQLException{
		Connection conn = getConnection();
		List<NoticeVO> list = new NoticeDAO().noticeList(conn, start, end);
		close(conn);
		return list;
		}
		
		public NoticeVO noticeDetail(int nno) throws SQLException {
			Connection conn = getConnection();
			NoticeVO vo = null;
			vo = new NoticeDAO().noticeDetail(conn, nno);
			close(conn);
			return vo;
		}
		
		public int noticeWrite(NoticeVO vo) throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().noticeWrite(conn, vo);
			System.out.println(result + "행 추가됨");
			close(conn);
			return result;
		}
		
		public int noticeUpdate(NoticeVO vo, int nno) throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().noticeUpdate(conn, vo, nno);
			close(conn);
			return result;
		}
		
		public int noticeDelete(int nno) throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().noticeDelete(conn, nno);
			close(conn);
			return result;			
		}

		public int viewCount(int nno) throws SQLException {
			Connection conn = getConnection();
			int result = new NoticeDAO().viewCount(conn,nno);
			close(conn);
			return result;
		}
	}
