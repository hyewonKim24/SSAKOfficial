package qna.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.QnAVO;
import service.qna.QnAService;

/**
 * Servlet implementation class qnaDetailCtrl
 */
@WebServlet("/qnaDetail.do")
public class qnaDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qnaDetailCtrl() {
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
		System.out.println("qna detail 서블릿 진입");
		QnAService qsv = new QnAService();
		int qno = 0;
		qno = Integer.parseInt(request.getParameter("qno"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			QnAVO qdetail = qsv.qnaDetail(qno);
			int qview = qsv.viewCount(qno);
			if (qdetail != null) {
				request.setAttribute("qdetail", qdetail);
				RequestDispatcher disp = request.getRequestDispatcher("./qna/qnaDetail.jsp");
				disp.forward(request, response);
			} else {
				System.out.println("상세페이지 불러오기 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
