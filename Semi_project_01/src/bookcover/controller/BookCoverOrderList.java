package bookcover.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cart.model.CartListVO;
import service.bookcover.bookCoverService;

/**
 * Servlet implementation class BookCoverOrderList
 */
@WebServlet("/BookCoverOrderList")
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
