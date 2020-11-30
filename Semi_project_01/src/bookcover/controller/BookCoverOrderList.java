package bookcover.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cart.model.CartListVO;
import member.model.memberVO;
import service.bookcover.bookCoverService;

/**
 * Servlet implementation class BookCoverOrderList
 */
@WebServlet("/BookCoverOrderList.do")
public class BookCoverOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCoverOrderList() {
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
		
		//로그인 안된 경우
		memberVO mvo = (memberVO) request.getSession().getAttribute("member");
		if (mvo == null || mvo.equals("") || mvo.equals("null")) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인을 해주세요.'); location.href='./member/memberLogin.jsp';</script>");
			writer.flush();
			writer.close();
		} else {
		String bookamount = request.getParameter("bookamount");
		String bisbn = request.getParameter("bisbn");
		int dno = Integer.parseInt(request.getParameter("dno"));
		bookCoverService bcsv=new bookCoverService();
		
		List<CartListVO> result;
		try {
			result = bcsv.directOrderList(bisbn, dno);
			request.setAttribute("list2", result);
			request.setAttribute("dioamount", bookamount);
			
			System.out.println("directorder.jsp로 이동.");
			RequestDispatcher ds = request.getRequestDispatcher("./order/directOrder.jsp");
			ds.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	}

}
