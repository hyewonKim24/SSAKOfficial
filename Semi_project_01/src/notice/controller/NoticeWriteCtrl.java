package notice.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.NoticeVO;
import service.notice.NoticeService;

/**
 * Servlet implementation class NoticeWriteCtrl
 */
@WebServlet("/noticeWrite.do")
public class NoticeWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeWriteCtrl() {
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

//		String mid =(request.getParameter("mid")!=null) ? request.getParameter("mid") : "0";
//		String ntitle = (request.getParameter("ntitle")!=null) ? request.getParameter("ntitle") : "0";
//		String ncontent = (request.getParameter("ncontent")!=null) ? request.getParameter("ncontent") : "0";

//		String mid = request.getParameter("mid");

		request.getSession().setAttribute("mid", "kim");
		String ntitle = request.getParameter("ntitle");
		System.out.println(ntitle);
		String ncontent = request.getParameter("ncontent");

		NoticeVO vo = new NoticeVO();
		vo.setMid(request.getSession().getAttribute("mid").toString());
//		vo.setMid(mid);
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);

		try {
			int result = nsv.noticeWrite(vo);
			if (result == 1) {
				System.out.println(result + "행 추가되었습니다. noticeWrite controller");
				request.setAttribute("noticeWrite", result);
				response.sendRedirect("./noticeList.do");
			} else {
				System.out.println("공지사항 등록 실패");
				request.setAttribute("register_fail", "등록에 실패했습니다. 다시 시도해 주세요.");
				RequestDispatcher disp = request.getRequestDispatcher("./notice/noticeWrite.jsp");
				disp.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
