package service.qna;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dao.NoticeDAO;
import dao.QnADAO;
import notice.model.NoticeVO;
import qna.model.QnAVO;

public class QnAService {
	private DataSource ds = null;
	private Connection conn = null;

	public QnAService() {
		Context initContext1;
		try {
			initContext1 = new InitialContext();
			Context envContext1 = (Context) initContext1.lookup("java:/comp/env");
			ds = (DataSource) envContext1.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public int getBoardCount() throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().getBoardCount(conn);
		conn.close();
		return result;
	}

	public List<QnAVO> qnaList(int start, int end) throws SQLException {
		Connection conn = ds.getConnection();
		List<QnAVO> list = new QnADAO().qnaList(conn, start, end);
		conn.close();
		return list;
	}

	public QnAVO qnaDetail(int nno) throws SQLException {
		Connection conn = ds.getConnection();
		QnAVO vo = null;
		vo = new QnADAO().qnaDetail(conn, nno);
		conn.close();
		return vo;
	}

	public int qnaWrite(QnAVO vo) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().qnaWrite(conn, vo);
		conn.close();
		return result;
	}

	public int qnaReply(QnAVO vo) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().qnaReply(conn, vo);
		conn.close();
		return result;
	}

	public int qnaUpdate(QnAVO vo, int qno) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().qnaUpdate(conn, vo, qno);
		conn.close();
		return result;
	}

	public int qnaDelete(int qref2) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().qnaDelete(conn, qref2);
		conn.close();
		return result;
	}

	public int viewCount(int qno) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().viewCount(conn, qno);
		conn.close();
		return result;
	}

	public List<QnAVO> qnaSearch(String qtype, String qSearch, int start, int end) throws SQLException {
		Connection conn = ds.getConnection();
		List<QnAVO> list = new QnADAO().qnaSearch(conn, qtype, qSearch, start, end);
		conn.close();
		return list;
	}

	public int qnaSearchCount(String qtype, String qsearch) throws SQLException {
		Connection conn = ds.getConnection();
		int result = new QnADAO().qnaSearchCount(conn, qtype, qsearch);
		System.out.println(result);
		conn.close();
		return result;
	}
}
