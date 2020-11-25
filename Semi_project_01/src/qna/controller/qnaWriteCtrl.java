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
		request.getSession().setAttribute("mid", "kim");
		String qtype = request.getParameter("qtype");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qpw = request.getParameter("qpw").trim();
		/*
		 * int qref = Integer.parseInt(request.getParameter("qref").trim()); int
		 * qref_step = Integer.parseInt(request.getParameter("qref_step").trim()); int
		 * qref_level = Integer.parseInt(request.getParameter("qref_level").trim());
		 */

//		if(qref == 0) {
//			qref = 0;
//			qref_step = 0;
//			qref_level = 0;
//		} 		
		QnAVO vo = new QnAVO();
		vo.setMid(request.getSession().getAttribute("mid").toString());
		vo.setQtype(qtype);
		vo.setQtitle(qtitle);
		vo.setQcontent(qcontent);
		vo.setQpw(qpw);
//		vo.setQref(qref);
//		vo.setQref_step(qref_step);
//		vo.setQref_level(qref_level);

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