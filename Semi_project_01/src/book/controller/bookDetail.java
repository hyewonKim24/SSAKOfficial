package book.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.model.*;
import service.book.bookService;

/**
 * Servlet implementation class bookDetail
 */
@WebServlet("/bookDetail.do")
public class bookDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookDetail() {
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

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bisbn = request.getParameter("bisbn");
		System.out.println(bisbn);
		
		//최근 본 상품.
		BookVO bvo1 = (BookVO) request.getSession().getAttribute("RecentBook1");

		if (bvo1 == null) {
			BookVO bvo = null;
			bookService bsv = new bookService();
			try {
				bvo = bsv.selectBook(bisbn);
				request.getSession().setAttribute("RecentBook1", bvo);
				System.out.println("recent_book" + bvo.getBtitle());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("bisbn", bisbn);
		} else {
			BookVO bvo2 = null;
			bookService bsv = new bookService();
			try {
				request.getSession().setAttribute("RecentBook2", bvo1);
				bvo2 = bsv.selectBook(bisbn);
				request.getSession().setAttribute("RecentBook1", bvo2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			bookService bsv1 = new bookService();
			try {
				List<BookVO> bestseller = bsv1.bestSellerList(61, 65);
				request.setAttribute("bestseller", bestseller);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			RequestDispatcher dis = request.getRequestDispatcher("./book/bookDetail.jsp");
			dis.forward(request, response);


		}
	}
}
