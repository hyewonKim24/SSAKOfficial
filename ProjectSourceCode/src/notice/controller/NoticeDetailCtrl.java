package notice.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.NoticeVO;
import service.notice.NoticeService;

/**
 * Servlet implementation class NoticeDetailCtrl
 */
@WebServlet("/noticeDetail.do")
public class NoticeDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeDetailCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NoticeService nsv = new NoticeService();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			NoticeVO ndetail = nsv.noticeDetail(nno);
			int noticeView = nsv.viewCount(nno);
			if (ndetail != null) {
				request.setAttribute("ndetail", ndetail);
				RequestDispatcher disp = request.getRequestDispatcher("./notice/noticeDetail.jsp");
				disp.forward(request, response);
			} else {
				System.out.println("상세페이지 불러오기 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
