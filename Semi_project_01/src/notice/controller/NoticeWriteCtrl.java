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

import member.model.memberVO;
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
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		ncontent.replaceAll("\n", "<br>");
		System.out.println(ntitle);
		NoticeVO vo = new NoticeVO();
		vo.setMid(mvo.getMid());
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
