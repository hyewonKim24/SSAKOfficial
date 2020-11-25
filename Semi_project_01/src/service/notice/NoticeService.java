package service.notice;

import java.sql.*;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import dao.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeService {
		private DataSource ds = null;
		private Connection conn = null;

		public NoticeService() {
			Context initContext1;
			try {
				initContext1 = new InitialContext();
				Context envContext1 = (Context)initContext1.lookup("java:/comp/env");
				ds = (DataSource)envContext1.lookup("jdbc/myoracle");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		public List<NoticeVO> noticeSearch(String nSearch, int start, int end) throws SQLException {
			Connection conn = ds.getConnection();
			List<NoticeVO> list = new NoticeDAO().noticeSearch(conn, nSearch, start, end);
			conn.close();
			return list;
		}
		
		public int getSearchCount(String nSearch) throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().getSearchCount(conn, nSearch);
			conn.close();
			return result;			
		}
		
		
		public int getBoardCount() throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().getBoardCount(conn);
			conn.close();
			return result;
		}

		public List<NoticeVO> noticeList(int start, int end) throws SQLException{
		Connection conn = ds.getConnection();
		List<NoticeVO> list = new NoticeDAO().noticeList(conn, start, end);
		conn.close();
		return list;
		}
		
		public NoticeVO noticeDetail(int nno) throws SQLException {
			Connection conn = ds.getConnection();
			NoticeVO vo = null;
			vo = new NoticeDAO().noticeDetail(conn, nno);
			conn.close();
			return vo;
		}
		
		public int noticeWrite(NoticeVO vo) throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().noticeWrite(conn, vo);
			System.out.println(result + "행 추가됨");
			conn.close();
			return result;
		}
		
		public int noticeUpdate(NoticeVO vo, int nno) throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().noticeUpdate(conn, vo, nno);
			conn.close();
			return result;
		}
		
		public int noticeDelete(int nno) throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().noticeDelete(conn, nno);
			conn.close();
			return result;			
		}

		public int viewCount(int nno) throws SQLException {
			Connection conn = ds.getConnection();
			int result = new NoticeDAO().viewCount(conn,nno);
			conn.close();
			return result;
		}
	}
