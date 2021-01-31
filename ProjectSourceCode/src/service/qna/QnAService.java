package service.qna;
import static common.filter.JDBCTemplete.close;
import static common.filter.JDBCTemplete.commit;
import static common.filter.JDBCTemplete.getConnection;
import static common.filter.JDBCTemplete.rollback;

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


	public int getBoardCount() throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().getBoardCount(conn);
		close(conn);
		return result;
	}

	public List<QnAVO> qnaList(int start, int end) throws SQLException {
		Connection conn = getConnection();
		List<QnAVO> list = new QnADAO().qnaList(conn, start, end);
		close(conn);
		return list;
	}

	public QnAVO qnaDetail(int nno) throws SQLException {
		Connection conn = getConnection();
		QnAVO vo = null;
		vo = new QnADAO().qnaDetail(conn, nno);
		close(conn);
		return vo;
	}

	public int qnaWrite(QnAVO vo) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().qnaWrite(conn, vo);
		close(conn);
		return result;
	}

	public int qnaReply(QnAVO vo) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().qnaReply(conn, vo);
		close(conn);
		return result;
	}

	public int qnaUpdate(QnAVO vo, int qno) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().qnaUpdate(conn, vo, qno);
		close(conn);
		return result;
	}

	public int qnaDelete(int qref2) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().qnaDelete(conn, qref2);
		close(conn);
		return result;
	}

	public int viewCount(int qno) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().viewCount(conn, qno);
		close(conn);
		return result;
	}

	public List<QnAVO> qnaSearch(String qtype, String qSearch, int start, int end) throws SQLException {
		Connection conn = getConnection();
		List<QnAVO> list = new QnADAO().qnaSearch(conn, qtype, qSearch, start, end);
		close(conn);
		return list;
	}

	public int qnaSearchCount(String qtype, String qsearch) throws SQLException {
		Connection conn = getConnection();
		int result = new QnADAO().qnaSearchCount(conn, qtype, qsearch);
		System.out.println(result);
		close(conn);
		return result;
	}
}
