package qna.controller;

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
import qna.model.QnAVO;
import service.notice.NoticeService;
import service.qna.QnAService;

/**
 * Servlet implementation class qnaWrite
 */
@WebServlet("/qnaWrite.do")
public class qnaWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qnaWriteCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
		System.out.println("write 서블릿 진입");
		QnAService qsv = new QnAService();
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		String qtype = request.getParameter("qtype");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		System.out.println(qcontent);
		qcontent.replaceAll("\n","<br>");
	
		QnAVO vo = new QnAVO();
		vo.setMid(mvo.getMid());
		vo.setQtype(qtype);
		vo.setQtitle(qtitle);
		vo.setQcontent(qcontent);

		try {
			int result = qsv.qnaWrite(vo);
			if (result == 1) {
				System.out.println(result + "행 추가되었습니다. qna등록 controller");
				request.setAttribute("qnaWrite", result);
				response.sendRedirect("./qnaList.do");
			} else {
				System.out.println("공지사항 등록 실패");
				request.setAttribute("register_fail", "등록에 실패했습니다. 다시 시도해 주세요.");
				RequestDispatcher disp = request.getRequestDispatcher("./qna/qnaWrite.jsp");
				disp.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}