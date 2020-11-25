package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class qnaUpdate
 */
@WebServlet("/qnaUpdate.do")
public class qnaUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qnaUpdateCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnAService qsv = new QnAService();
		PrintWriter out = response.getWriter();
		
		String qtype = request.getParameter("qtype");
		int qno = Integer.parseInt(request.getParameter("qno").trim());
		String mid = request.getParameter("mid");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qpw = request.getParameter("qpw");
		
		QnAVO vo = new QnAVO();
		vo.setQno(qno);
		vo.setMid(mid);
		vo.setQtitle(qtitle);
		vo.setQcontent(qcontent);
		vo.setQpw(qpw);

		
		try {
			int result = qsv.qnaUpdate(vo,qno);
			System.out.println(vo);
			if(result == 1) {
				System.out.println(result+"행이 수정되었습니다");
				request.setAttribute("noticeUpdate", "수정이 완료되었습니다.");
				RequestDispatcher disp = request.getRequestDispatcher("./qnaDetail.do");
				disp.forward(request, response);
				out.println("수정되었습니다.");
			} else {
				RequestDispatcher disp = request.getRequestDispatcher("./qnaDetail.do");
				disp.forward(request, response);
				System.out.println("수정하지 못했습니다");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("수정 오류 발생");
		}
		out.flush();
		out.close();
	}
}
