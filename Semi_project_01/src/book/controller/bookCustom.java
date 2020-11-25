package book.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.*;
import service.book.bookService;

/**
 * Servlet implementation class bookCustom
 */
@WebServlet("/bookCustom.do")
public class bookCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookCustom() {
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
	 
		String bookamount=request.getParameter("bookamount");
		String bisbn=request.getParameter("bisbn");
		
		bookService bsv = new bookService();
		try {
			BookVO bvo= bsv.selectBook(bisbn);
			
	         request.setAttribute("bvo", bvo);
	         request.setAttribute("bookamount", bookamount);
			 RequestDispatcher disp = request.getRequestDispatcher("./book/bookCustom01.jsp"); 
	         disp.forward(request, response);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 
 }
}
